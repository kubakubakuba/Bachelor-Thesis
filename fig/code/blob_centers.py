def detect_blobs(image: np.ndarray) -> List[Tuple[int, int]]:
    blurred_image = cv2.GaussianBlur(image, (5, 5), 0)

    #create a binary image for the blob detection
    _, binary_mask = cv2.threshold(blurred_image, 50, 255, cv2.THRESH_BINARY)

    contours, _ = cv2.findContours(binary_mask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

    centers = []
    for contour in contours:
        mask = np.zeros_like(image)
        cv2.drawContours(mask, [contour], -1, 255, -1)

        #select the current blob on the original image
        masked_image = cv2.bitwise_and(image, image, mask=mask)
        
        #detect the maximum value and location in the current blob
        _, max_val, _, max_loc = cv2.minMaxLoc(masked_image)

        if max_val > 0:
            centers.append(max_loc)
	
    return centers