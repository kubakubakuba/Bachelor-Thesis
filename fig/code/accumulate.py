def accumulate_events(raw_file, start_time_us, accumulation_time_us, output_file, threshold):
    reader = RawReader(raw_file)
    reader.seek_time(start_time_us)

    height, width = reader.get_size()
    pos_accumulator = np.zeros((height, width), dtype=np.uint16)
    neg_accumulator = np.zeros((height, width), dtype=np.uint16)

    end_time_us = start_time_us + accumulation_time_us
    while reader.current_time < end_time_us:
        events = reader.load_delta_t(1000)
        if events is None:
            break

        #event accumulation
        for event in events:
            x, y, p, _ = event
            if p > 0:
                pos_accumulator[y, x] += 1
            else:
                neg_accumulator[y, x] += 1

    pos_acc_n = cv2.normalize(pos_accumulator, None, 0, 255, cv2.NORM_MINMAX, dtype=cv2.CV_8U)
    neg_acc_n = cv2.normalize(neg_accumulator, None, 0, 255, cv2.NORM_MINMAX, dtype=cv2.CV_8U)

    #blending of the normalized positive and negative images
    combined_accumulator = cv2.addWeighted(pos_acc_n, 0.5, neg_acc_n, 0.5, 0)

    cv2.imwrite(output_file, combined_accumulator)