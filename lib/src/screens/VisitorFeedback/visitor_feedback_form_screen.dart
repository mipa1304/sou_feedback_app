import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'visitor_feedback_area.dart';
import 'visitor_feedback_service.dart';

class VisitorFeedbackFormScreen extends StatefulWidget {
  const VisitorFeedbackFormScreen({
    Key? key,
    required this.area,
  }) : super(key: key);

  final VisitorFeedbackArea area;

  @override
  State<VisitorFeedbackFormScreen> createState() =>
      _VisitorFeedbackFormScreenState();
}

class _VisitorFeedbackFormScreenState extends State<VisitorFeedbackFormScreen> {
  static const _languages = <_FeedbackLanguage>[
    _FeedbackLanguage('en', 'English'),
    _FeedbackLanguage('hi', 'हिन्दी'),
    _FeedbackLanguage('gu', 'ગુજરાતી'),
    _FeedbackLanguage('ta', 'தமிழ்'),
  ];

  final SpeechToText _speech = SpeechToText();
  final TextEditingController _commentController = TextEditingController();
  final VisitorFeedbackService _feedbackService = VisitorFeedbackService();
  _FeedbackLanguage _language = _languages.first;
  int? _rating;
  bool _speechInitialized = false;
  bool _isListening = false;
  bool _isSubmitting = false;
  bool _usedVoiceInput = false;
  bool _editedText = false;
  bool _applyingTranscript = false;

  @override
  void dispose() {
    _speech.stop();
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _toggleVoiceInput() async {
    if (_isListening) {
      await _speech.stop();
      if (mounted) setState(() => _isListening = false);
      return;
    }

    if (!_speechInitialized) {
      _speechInitialized = await _speech.initialize(
        onStatus: (status) {
          if (mounted) {
            setState(() => _isListening = status == 'listening');
          }
        },
        onError: (error) {
          if (mounted) {
            setState(() => _isListening = false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Voice input error: ${error.errorMsg}')),
            );
          }
        },
      );
    }

    if (!_speechInitialized) {
      _showMessage('Speech recognition is not available on this device.');
      return;
    }

    try {
      final locales = await _speech.locales();
      LocaleName? locale;
      for (final candidate in locales) {
        if (candidate.localeId.toLowerCase().startsWith(_language.code)) {
          locale = candidate;
          break;
        }
      }
      if (locale == null) {
        _showMessage(
          'Speech recognition for ${_language.name} is not available on this device.',
        );
        return;
      }

      _usedVoiceInput = true;
      await _speech.listen(
        localeId: locale.localeId,
        listenFor: const Duration(minutes: 1),
        pauseFor: const Duration(seconds: 5),
        onResult: (result) {
          if (!mounted) return;
          _applyingTranscript = true;
          _commentController.text = result.recognizedWords;
          _commentController.selection = TextSelection.collapsed(
            offset: _commentController.text.length,
          );
          _applyingTranscript = false;
          setState(() {});
        },
      );
      if (mounted) setState(() => _isListening = true);
    } catch (error) {
      _showMessage('Unable to start voice input: $error');
    }
  }

  String get _inputMethod {
    if (_usedVoiceInput && _editedText) return 'mixed';
    if (_usedVoiceInput) return 'voice';
    return 'typed';
  }

  Future<void> _submit() async {
    if (_rating == null && _commentController.text.trim().isEmpty) {
      _showMessage('Add a rating or a comment before submitting.');
      return;
    }
    if (_commentController.text.trim().length > 2000) {
      _showMessage('Comments must be 2000 characters or fewer.');
      return;
    }

    setState(() => _isSubmitting = true);
    try {
      await _feedbackService.submit(
        area: widget.area,
        rating: _rating,
        comment: _commentController.text,
        languageCode: _language.code,
        languageName: _language.name,
        inputMethod: _inputMethod,
      );
      if (!mounted) return;
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          icon: const Icon(Icons.check_circle_outline, color: Colors.green),
          title: const Text('Thank you!'),
          content: const Text('Your feedback has been submitted.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Done'),
            ),
          ],
        ),
      );
      if (mounted) Navigator.of(context).pop();
    } catch (error) {
      if (mounted) {
        _showMessage('Could not submit your feedback: $error');
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  void _showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.area.name)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'How was your experience?',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<_FeedbackLanguage>(
            value: _language,
            decoration: const InputDecoration(
              labelText: 'Preferred language',
              border: OutlineInputBorder(),
            ),
            items: [
              for (final language in _languages)
                DropdownMenuItem(
                  value: language,
                  child: Text(language.name),
                ),
            ],
            onChanged: _isListening
                ? null
                : (language) {
                    if (language != null) setState(() => _language = language);
                  },
          ),
          const SizedBox(height: 24),
          const Text('Your rating (optional)'),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var value = 1; value <= 5; value++)
                IconButton(
                  tooltip: '$value ${value == 1 ? 'star' : 'stars'}',
                  onPressed: () => setState(() => _rating = value),
                  iconSize: 40,
                  color: _rating != null && value <= _rating!
                      ? Colors.amber.shade700
                      : Colors.grey,
                  icon: Icon(
                    _rating != null && value <= _rating!
                        ? Icons.star
                        : Icons.star_border,
                  ),
                ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Text(_rating == null ? 'Tap to rate' : '$_rating out of 5'),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _commentController,
            minLines: 4,
            maxLines: 7,
            maxLength: 2000,
            onChanged: (_) {
              if (!_applyingTranscript) _editedText = true;
              setState(() {});
            },
            decoration: const InputDecoration(
              labelText: 'Comment (optional)',
              hintText: 'Type your feedback or use the microphone.',
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: _isSubmitting ? null : _toggleVoiceInput,
            icon: Icon(_isListening ? Icons.stop : Icons.mic),
            label: Text(
              _isListening ? 'Stop voice input' : 'Speak in ${_language.name}',
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Your speech is transcribed on this device and saved as text.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 52,
            child: FilledButton(
              onPressed: _isSubmitting ? null : _submit,
              child: _isSubmitting
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Submit feedback'),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeedbackLanguage {
  const _FeedbackLanguage(this.code, this.name);

  final String code;
  final String name;
}
