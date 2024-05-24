; vim /usr/share/festival/lib/festival.scm

(provide 'festival)
; ----------------------------------------------------------------------
;      Agregar estas dos lineas a festival.scm
; ----------------------------------------------------------------------
(set! voice_default 'voice_JuntaDeAndalucia_es_sf_diphone)
(set! voice_default 'voice_JuntaDeAndalucia_es_pa_diphone)
; ----------------------------------------------------------------------
(define (tts_textasterisk string mode)
