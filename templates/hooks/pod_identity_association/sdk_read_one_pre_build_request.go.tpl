	// Recover a missing associationID on any adopt-or-create resource (not just the
	// first adoption pass); NeedAdoption goes false once adopted, leaving it unrecoverable.
	if r.ko.Status.AssociationID == nil && (runtime.NeedAdoption(r) || runtime.IsAdopted(r)) {
		r.ko.Status.AssociationID, err = rm.getAssociationID(ctx, r)
		if err != nil {
			return nil, err
		}
	}