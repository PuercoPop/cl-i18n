;; This software is Copyright (c) Leslie P. Polzer, 2011.
;; Leslie P. Polzer grants you the rights to distribute
;; and use this software as governed by the terms
;; of the Lisp Lesser GNU Public License
;; (http://opensource.franz.com/preamble.html),
;; known as the LLGPL

(in-package conditions)

(defmacro defcond (type)
  `(define-condition ,(alexandria:format-symbol t "TEXT-~a" (string-upcase type))
       (,type)
       ((text 
	 :initarg :text 
	 :reader text))
     (:documentation "Error that set text")))


(defcond error)
(defcond warning)



(define-condition no-translation-table-error (text-error) 
  ()
  (:report (lambda (condition stream) 
	    (format stream "~a" (text condition)))))


(define-condition no-translation (text-warning)
  ()
  (:report (lambda (condition stream) 
	     (format stream "~a" (text condition)))))

