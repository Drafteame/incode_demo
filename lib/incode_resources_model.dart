mixin IncodeResourcesModel {
  static Map<String, dynamic> get theme {
    return <String, dynamic>{
      'colors': <String, dynamic>{
        'background': 'rgba(18, 18, 18, 1.0)',
        'secondaryBackground': 'rgba(38, 38, 38, 0.8)',
        'accent': 'rgba(0, 122, 255, 1.0)',
        'primary': 'rgba(28, 28, 28, 0.9)',
        'success': 'rgba(52, 199, 89, 1.0)',
        'error': 'rgba(255, 59, 48, 1.0)',
        'warning': 'rgba(255, 149, 0, 1.0)',
      },
      'buttons': <String, dynamic>{
        'primary': <String, dynamic>{
          'states': <String, dynamic>{
            'normal': <String, dynamic>{
              'cornerRadius': 8.0,
              'textColor': 'rgba(255, 255, 255, 1.0)',
              'backgroundColor': 'rgba(0, 122, 255, 1.0)',
            },
            'highlighted': <String, dynamic>{
              'cornerRadius': 8.0,
              'textColor': 'rgba(255, 255, 255, 1.0)',
              'backgroundColor': 'rgba(0, 122, 255, 0.8)',
            },
            'disabled': <String, dynamic>{
              'cornerRadius': 8.0,
              'textColor': 'rgba(255, 255, 255, 1.0)',
              'backgroundColor': 'rgba(142, 142, 147, 0.2)',
            },
          },
        },
        'secondary': <String, dynamic>{
          'states': <String, dynamic>{
            'normal': <String, dynamic>{
              'cornerRadius': 8.0,
              'textColor': 'rgba(255, 255, 255, 1.0)',
              'backgroundColor': 'rgba(38, 38, 38, 0.8)',
            },
            'highlighted': <String, dynamic>{
              'cornerRadius': 8.0,
              'textColor': 'rgba(255, 255, 255, 1.0)',
              'backgroundColor': 'rgba(38, 38, 38, 0.6)',
            },
            'disabled': <String, dynamic>{
              'cornerRadius': 8.0,
              'textColor': 'rgba(255, 255, 255, 1.0)',
              'backgroundColor': 'rgba(142, 142, 147, 0.2)',
            },
          },
        },
        'text': <String, dynamic>{
          'states': <String, dynamic>{
            'normal': <String, dynamic>{
              'cornerRadius': 8.0,
              'backgroundColor': 'rgba(0, 0, 0, 0.0)',
              'textColor': 'rgba(255, 255, 255, 1.0)',
            },
            'highlighted': <String, dynamic>{
              'cornerRadius': 8.0,
              'backgroundColor': 'rgba(0, 0, 0, 0.0)',
              'textColor': 'rgba(255, 255, 255, 0.8)',
            },
            'disabled': <String, dynamic>{
              'cornerRadius': 8.0,
              'backgroundColor': 'rgba(0, 0, 0, 0.0)',
              'textColor': 'rgba(255, 255, 255, 1.0)',
            },
          },
        },
      },
      'labels': <String, dynamic>{
        'title': <String, dynamic>{'textColor': 'rgba(255, 255, 255, 1.0)'},
        'secondaryTitle': <String, dynamic>{
          'textColor': 'rgba(255, 255, 255, 1.0)'
        },
        'subtitle': <String, dynamic>{'textColor': 'rgba(255, 255, 255, 1.0)'},
        'secondarySubtitle': <String, dynamic>{
          'textColor': 'rgba(255, 255, 255, 1.0)'
        },
        'smallSubtitle': <String, dynamic>{
          'textColor': 'rgba(255, 255, 255, 1.0)'
        },
        'info': <String, dynamic>{'textColor': 'rgba(255, 255, 255, 1.0)'},
        'secondaryInfo': <String, dynamic>{
          'textColor': 'rgba(255, 255, 255, 1.0)'
        },
        'body': <String, dynamic>{'textColor': 'rgba(255, 255, 255, 1.0)'},
        'secondaryBody': <String, dynamic>{
          'textColor': 'rgba(255, 255, 255, 1.0)'
        },
        'code': <String, dynamic>{'textColor': 'rgba(255, 255, 255, 1.0)'},
      },
      'customComponents': <String, dynamic>{
        'idSideLabel': <String, dynamic>{
          'backgroundColor': 'rgba(18, 18, 18, 1.0)',
        },
      },
    };
  }

  static Map<String, String> get strings {
    return <String, String>{
      // iOS labels
      'incdOnboarding.idChooser.title': 'Choose your document type',
      'incdOnboarding.idChooser.idButton': 'ID Card',
      'incdOnboarding.idChooser.passportButton': 'Passport',
      'incdOnboarding.idTips0': 'Make sure your ID is clearly visible',
      'incdOnboarding.idTips2': 'Avoid glare and shadows',
      'incdOnboarding.id.help.btnOk': 'Try Again',
      'incdOnboarding.id.manualCaptureInfo':
          'Position your ID within the frame',
      'incdOnboarding.id.showFrontIDSide': 'Show the front of your ID',
      'incdOnboarding.id.showBackIDSide': 'Show the back of your ID',
      'incdOnboarding.idBackTips.title': 'Back of ID',
      'incdOnboarding.idBackTips.title.highlight': 'Back',
      'incdOnboarding.id.help.positionDesc':
          'Make sure your ID is within the frame',
      'incdOnboarding.id.help.shadowDesc':
          'Avoid shadows and glares on your ID',
      'incdOnboarding.id.err.sharpness': 'The ID image is not clear enough',
      'incdOnboarding.processId.status': 'Verifying your identity',
      'incdOnboarding.processId.description': 'This will only take a moment',
      'incdOnboarding.selfieTips.title': 'Take a selfie',
      'incdOnboarding.selfieTips.subtitle':
          'Position your face within the frame',
      'incdOnboarding.match.livenessFailed': 'Face verification failed',
      'incdOnboarding.match.livenessSuccess': 'Face verification successful',
      'incdOnboarding.id.err.uploadIssue.glare.hint':
          'Remove any glare from your ID',
      'ncdOnboarding.id.err.uploadIssue.blur.hint':
          'Ensure your ID is not blurry',

      // Android labels
      'onboard_sdk_id_type_chooser_title': 'Choose your document type',
      'onboard_sdk_btn_id': 'ID Card',
      'onboard_sdk_btn_passport': 'Passport',
      'onboard_sdk_tutorial_front_1_title':
          'Make sure your ID is clearly visible',
      'onboard_sdk_tutorial_front_3_title': 'Avoid glare and shadows',
      'onboard_sdk_id_scan_help_btn_ok': 'Try Again',
      'onboard_sdk_validation_manual_capture_instructions':
          'Position your ID within the frame',
      'onboard_sdk_validation_warn_show_front': 'Show the front of your ID',
      'onboard_sdk_validation_show_front': 'Show the front of your ID',
      'onboard_sdk_validation_warn_show_back': 'Show the back of your ID',
      'onboard_sdk_validation_show_back': 'Show the back of your ID',
      'onboard_sdk_tutorial_back_title': 'Back of ID',
      'onboard_sdk_tutorial_back_title_highlighted_part': 'Back',
      'onboard_sdk_id_scan_help_common_issue_1':
          'Make sure your ID is within the frame',
      'onboard_sdk_id_scan_help_common_issue_2':
          'Avoid shadows and glares on your ID',
      'onboard_sdk_validation_sharpness_failed':
          'The ID image is not clear enough',
      'onboard_sdk_process_id_loading_title': 'Verifying your identity',
      'onboard_sdk_process_id_loading_subtitle': 'This will only take a moment',
      'onboard_sdk_tutorial_selfie_title': 'Take a selfie',
      'onboard_sdk_tutorial_selfie_subtitle':
          'Position your face within the frame',
      'onboard_sdk_recognition_result_liveness_success':
          'Face verification successful',
      'onboard_sdk_recognition_result_liveness_failed':
          'Face verification failed',
      'onboard_sdk_id_scan_help_glare_present_hint':
          'Remove any glare from your ID',
      'onboard_sdk_id_scan_help_blur_present_hint':
          'Ensure your ID is not blurry',
    };
  }

  static const List<String> sdkMaliciousErrors = <String>[
    'rootDetected',
    'hookDetected',
    'simulatorDetected',
  ];

  static String get genericError =>
      'An error occurred. Please contact support.';
}
