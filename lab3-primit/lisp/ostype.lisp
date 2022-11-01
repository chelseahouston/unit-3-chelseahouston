(defvar os-names-types 
    '((ANDROID . MOBILE) (IOS . MOBILE) (MACOSX . DESKTOP) (WINDOWS8 . DESKTOP) 
            (WP8 . MOBILE) (VXWORKS . EMBEDDED)))
    ; a list of pairs

(defvar os-names
    (mapcar 'car os-names-types))
     ; take the first element from each pair and put them in a list, removing duplicates

(defvar os-types
    (remove-duplicates 
    (mapcar 'cdr os-names-types)))
        ; take the second element from each pair and put them in a list

(defun os-typep (a)
    (member a os-types))
    ; check whether a is in the list os-types
    ; os-typep means "is a OS type? predicate"

(defun os-namep (a)
    (member a os-names))
    ; check whether a is in the list os-names
    ; os-namep means "is a OS name? predicate"

(defun os-name-to-type (name)
    (cdr (assoc name os-names-types)))
    ; lookup a pair by the first element (ie os name)
    ; and return the second element (ie the type)

(defun os-type-to-name (code)
    (car (rassoc code os-names-types)))
    ; lookup a pair by the second element (ie os type)
    ; and return the first element of the first matching pair (ie os name)

(defun get-type ()
    (write-string (format nil "input device: ~%"))
    (let*
        ((line (read-line)) ;get a line as a string
         (element (read-from-string line))) ;parse the line
        (if (os-typep element) ;is element a valid device?
            ; then:
            element ;yes, return it
            ; else:
            (progn ; progn = evaluate a sequence of expressions and return the result of the last one
                (write-line "Invalid device, please try again.")
                (get-type))))) ;start over using recursion

(write-string "Known Devices: ")
(write-string (format nil "~A~%" os-types)) 
    ;"~%" means end of line
    ;"~A" means format a symbol aesthetically

(let ((os-type (get-type)))
    (write-string
        (format nil "An example of an os on ~A is: ~A~%" os-type (os-type-to-name os-type))))
