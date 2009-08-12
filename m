From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 1/3] kms: Don't hardcode the output properties
Date: Wed, 12 Aug 2009 02:18:26 +0200
Message-ID: <1250036308-28736-2-git-send-email-currojerez@riseup.net>
References: <1250036308-28736-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250036308-28736-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Replicate any properties the kernel exposes. Mostly taken from the
intel DDX.
---
 src/drmmode_display.c |  303 ++++++++++++++++++++++++-------------------------
 1 files changed, 151 insertions(+), 152 deletions(-)

diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index 3f04be1..805dc5b 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -58,11 +58,22 @@ typedef struct {
 } drmmode_crtc_private_rec, *drmmode_crtc_private_ptr;
 
 typedef struct {
+	drmModePropertyPtr mode_prop;
+	int index; /* Index within the kernel-side property arrays for
+		    * this connector. */
+	int num_atoms; /* if range prop, num_atoms == 1; if enum prop,
+			* num_atoms == num_enums + 1 */
+	Atom *atoms;
+} drmmode_prop_rec, *drmmode_prop_ptr;
+
+typedef struct {
     drmmode_ptr drmmode;
     int output_id;
     drmModeConnectorPtr mode_output;
     drmModeEncoderPtr mode_encoder;
     drmModePropertyBlobPtr edid_blob;
+    int num_props;
+    drmmode_prop_ptr props;
 } drmmode_output_private_rec, *drmmode_output_private_ptr;
 
 static void drmmode_output_dpms(xf86OutputPtr output, int mode);
@@ -613,9 +624,14 @@ static void
 drmmode_output_destroy(xf86OutputPtr output)
 {
 	drmmode_output_private_ptr drmmode_output = output->driver_private;
+	int i;
 
 	if (drmmode_output->edid_blob)
 		drmModeFreePropertyBlob(drmmode_output->edid_blob);
+	for (i = 0; i < drmmode_output->num_props; i++) {
+		drmModeFreeProperty(drmmode_output->props[i].mode_prop);
+		xfree(drmmode_output->props[i].atoms);
+	}
 	drmModeFreeConnector(drmmode_output->mode_output);
 	xfree(drmmode_output);
 	output->driver_private = NULL;
@@ -652,140 +668,110 @@ drmmode_output_dpms(xf86OutputPtr output, int mode)
 				    mode_id, mode);
 }
 
-/*
- * Several scaling modes exist, let the user choose.
- */
-struct drmmode_enum {
-	char *name;
-	int value;
-};
-
-static struct drmmode_enum scaling_mode[] = {
-	{ "non-gpu", DRM_MODE_SCALE_NON_GPU },
-	{ "fullscreen", DRM_MODE_SCALE_FULLSCREEN },
-	{ "aspect", DRM_MODE_SCALE_ASPECT },
-	{ "noscale", DRM_MODE_SCALE_NO_SCALE },
-	{ NULL, -1 /* invalid */ }
-};
-static Atom scaling_mode_atom;
-
-static struct drmmode_enum dithering_mode[] = {
-	{ "off", DRM_MODE_DITHERING_OFF },
-	{ "on", DRM_MODE_DITHERING_ON },
-	{ NULL, -1 /* invalid */ }
-};
-static Atom dithering_atom;
-
-static int
-drmmode_enum_lookup_value(struct drmmode_enum *ptr, char *name, int size) {
-	if (size == 0)
-		size = strlen(name);
-
-	while (ptr->name) {
-		if (!strcmp(name, ptr->name))
-			return ptr->value;
-		ptr++;
-	}
-
-	return -1;
-}
-
-static char *
-drmmode_enum_lookup_name(struct drmmode_enum *ptr, int value)
+static Bool
+drmmode_property_ignore(drmModePropertyPtr prop)
 {
-	while (ptr->name) {
-		if (ptr->value == value)
-			return ptr->name;
-		ptr++;
-	}
+	if (!prop)
+	    return TRUE;
+	/* ignore blob prop */
+	if (prop->flags & DRM_MODE_PROP_BLOB)
+		return TRUE;
+	/* ignore standard property */
+	if (!strcmp(prop->name, "EDID") ||
+	    !strcmp(prop->name, "DPMS"))
+		return TRUE;
 
-	return NULL;
+	return FALSE;
 }
 
-drmModePropertyPtr
-drmmode_output_property_find(xf86OutputPtr output, uint32_t type,
-			     const char *name)
+static void
+drmmode_output_create_resources(xf86OutputPtr output)
 {
 	drmmode_output_private_ptr drmmode_output = output->driver_private;
-	drmModeConnectorPtr koutput = drmmode_output->mode_output;
+	drmModeConnectorPtr mode_output = drmmode_output->mode_output;
 	drmmode_ptr drmmode = drmmode_output->drmmode;
-	drmModePropertyPtr props;
-	int i;
+	drmModePropertyPtr drmmode_prop;
+	uint32_t value;
+	int i, j, err;
 
-	for (i = 0; i < koutput->count_props; i++) {
-		props = drmModeGetProperty(drmmode->fd, koutput->props[i]);
+	drmmode_output->props = xcalloc(mode_output->count_props, sizeof(drmmode_prop_rec));
+	if (!drmmode_output->props)
+		return;
 
-		if (!props || !(props->flags & type))
+	drmmode_output->num_props = 0;
+	for (i = 0, j = 0; i < mode_output->count_props; i++) {
+		drmmode_prop = drmModeGetProperty(drmmode->fd, mode_output->props[i]);
+		if (drmmode_property_ignore(drmmode_prop)) {
+			drmModeFreeProperty(drmmode_prop);
 			continue;
-		
-		if (!strcmp(props->name, name))
-			return props;
-	}
-
-	return NULL;
-}
-
-static const char *
-drmmode_output_property_string(xf86OutputPtr output, struct drmmode_enum *ptr,
-			       const char *prop)
-{
-	drmmode_output_private_ptr drmmode_output = output->driver_private;
-	drmModeConnectorPtr koutput = drmmode_output->mode_output;
-	drmModePropertyPtr props;
-	const char *name;
-	int i;
-
-	props = drmmode_output_property_find(output, DRM_MODE_PROP_ENUM, prop);
-	if (!props)
-		return "unknown_prop";
-
-	for (i = 0; i < koutput->count_props; i++) {
-		if (koutput->props[i] == props->prop_id)
-			break;
-	}
-
-	if (koutput->props[i] != props->prop_id)
-		return "unknown_output_prop";
-
-	name = drmmode_enum_lookup_name(ptr, koutput->prop_values[i]);
-	return name ? name : "unknown_enum";
-}
-
-static void
-drmmode_output_create_resources(xf86OutputPtr output)
-{
-	ScrnInfoPtr pScrn = output->scrn;
-	const char *name;
-	int ret;
-
-	scaling_mode_atom = MakeAtom("SCALING_MODE", 12, TRUE);
-	dithering_atom = MakeAtom("DITHERING", 9, TRUE);
-
-	ret = RRConfigureOutputProperty(output->randr_output, scaling_mode_atom,
-					FALSE, FALSE, FALSE, 0, NULL);
-	if (ret) {
-		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
-			   "Error creating SCALING_MODE property: %d\n", ret);
+		}
+		drmmode_output->props[j].mode_prop = drmmode_prop;
+		drmmode_output->props[j].index = i;
+		drmmode_output->num_props++;
+		j++;
 	}
 
-	name = drmmode_output_property_string(output, scaling_mode,
-					      "scaling mode");
-	RRChangeOutputProperty(output->randr_output, scaling_mode_atom,
-			       XA_STRING, 8, PropModeReplace, strlen(name),
-			       (char *)name, FALSE, FALSE);
-
-	ret = RRConfigureOutputProperty(output->randr_output, dithering_atom,
-					FALSE, FALSE, FALSE, 0, NULL);
-	if (ret) {
-		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
-			   "Error creating DITHERING property: %d\n", ret);
+	for (i = 0; i < drmmode_output->num_props; i++) {
+		drmmode_prop_ptr p = &drmmode_output->props[i];
+		drmmode_prop = p->mode_prop;
+
+		value = drmmode_output->mode_output->prop_values[p->index];
+
+		if (drmmode_prop->flags & DRM_MODE_PROP_RANGE) {
+			INT32 range[2];
+
+			p->num_atoms = 1;
+			p->atoms = xcalloc(p->num_atoms, sizeof(Atom));
+			if (!p->atoms)
+				continue;
+			p->atoms[0] = MakeAtom(drmmode_prop->name, strlen(drmmode_prop->name), TRUE);
+			range[0] = drmmode_prop->values[0];
+			range[1] = drmmode_prop->values[1];
+			err = RRConfigureOutputProperty(output->randr_output, p->atoms[0],
+							FALSE, TRUE,
+							drmmode_prop->flags & DRM_MODE_PROP_IMMUTABLE ? TRUE : FALSE,
+							2, range);
+			if (err != 0) {
+				xf86DrvMsg(output->scrn->scrnIndex, X_ERROR,
+					   "RRConfigureOutputProperty error, %d\n", err);
+			}
+			err = RRChangeOutputProperty(output->randr_output, p->atoms[0],
+						     XA_INTEGER, 32, PropModeReplace, 1,
+						     &value, FALSE, FALSE);
+			if (err != 0) {
+				xf86DrvMsg(output->scrn->scrnIndex, X_ERROR,
+					   "RRChangeOutputProperty error, %d\n", err);
+			}
+		} else if (drmmode_prop->flags & DRM_MODE_PROP_ENUM) {
+			p->num_atoms = drmmode_prop->count_enums + 1;
+			p->atoms = xcalloc(p->num_atoms, sizeof(Atom));
+			if (!p->atoms)
+				continue;
+			p->atoms[0] = MakeAtom(drmmode_prop->name, strlen(drmmode_prop->name), TRUE);
+			for (j = 1; j <= drmmode_prop->count_enums; j++) {
+				struct drm_mode_property_enum *e = &drmmode_prop->enums[j-1];
+				p->atoms[j] = MakeAtom(e->name, strlen(e->name), TRUE);
+			}
+			err = RRConfigureOutputProperty(output->randr_output, p->atoms[0],
+							FALSE, FALSE,
+							drmmode_prop->flags & DRM_MODE_PROP_IMMUTABLE ? TRUE : FALSE,
+							p->num_atoms - 1, (INT32 *)&p->atoms[1]);
+			if (err != 0) {
+				xf86DrvMsg(output->scrn->scrnIndex, X_ERROR,
+					   "RRConfigureOutputProperty error, %d\n", err);
+			}
+			for (j = 0; j < drmmode_prop->count_enums; j++)
+				if (drmmode_prop->enums[j].value == value)
+					break;
+			/* there's always a matching value */
+			err = RRChangeOutputProperty(output->randr_output, p->atoms[0],
+						     XA_ATOM, 32, PropModeReplace, 1, &p->atoms[j+1], FALSE, FALSE);
+			if (err != 0) {
+				xf86DrvMsg(output->scrn->scrnIndex, X_ERROR,
+					   "RRChangeOutputProperty error, %d\n", err);
+			}
+		}
 	}
-
-	name = drmmode_output_property_string(output, dithering_mode,
-					      "dithering");
-	RRChangeOutputProperty(output->randr_output, dithering_atom,
-			       XA_STRING, 8, PropModeReplace, strlen(name),
-			       (char *)name, FALSE, FALSE);
 }
 
 static Bool
@@ -794,47 +780,60 @@ drmmode_output_set_property(xf86OutputPtr output, Atom property,
 {
 	drmmode_output_private_ptr drmmode_output = output->driver_private;
 	drmmode_ptr drmmode = drmmode_output->drmmode;
-	drmModePropertyPtr props;
-	int mode, ret = 0;
+	int i, ret;
 
-	if (property == scaling_mode_atom) {
-		if (value->type != XA_STRING || value->format != 8)
-			return FALSE;
+	for (i = 0; i < drmmode_output->num_props; i++) {
+		drmmode_prop_ptr p = &drmmode_output->props[i];
 
-		mode = drmmode_enum_lookup_value(scaling_mode, value->data,
-						 value->size);
-		if (mode == -1)
-			return FALSE;
+		if (p->atoms[0] != property)
+			continue;
 
-		props = drmmode_output_property_find(output, DRM_MODE_PROP_ENUM,
-						     "scaling mode");
-		if (!props)
-			return FALSE;
+		if (p->mode_prop->flags & DRM_MODE_PROP_RANGE) {
+			uint32_t val;
 
-		ret = drmModeConnectorSetProperty(drmmode->fd,
-						  drmmode_output->output_id,
-						  props->prop_id, mode);
-	} else
-	if (property == dithering_atom) {
-		if (value->type != XA_STRING || value->format != 8)
-			return FALSE;
+			if (value->type != XA_INTEGER || value->format != 32 ||
+			    value->size != 1)
+				return FALSE;
+			val = *(uint32_t *)value->data;
 
-		mode = drmmode_enum_lookup_value(dithering_mode, value->data,
-						 value->size);
-		if (mode == -1)
-			return FALSE;
+			ret = drmModeConnectorSetProperty(drmmode->fd, drmmode_output->output_id,
+							  p->mode_prop->prop_id, (uint64_t)val);
 
-		props = drmmode_output_property_find(output, DRM_MODE_PROP_ENUM,
-						     "dithering");
-		if (!props)
-			return FALSE;
+			if (ret)
+				return FALSE;
+
+			return TRUE;
 
-		ret = drmModeConnectorSetProperty(drmmode->fd,
-						  drmmode_output->output_id,
-						  props->prop_id, mode);
+		} else if (p->mode_prop->flags & DRM_MODE_PROP_ENUM) {
+			Atom	atom;
+			const char	*name;
+			int		j;
+
+			if (value->type != XA_ATOM || value->format != 32 || value->size != 1)
+				return FALSE;
+			memcpy(&atom, value->data, 4);
+			name = NameForAtom(atom);
+
+			/* search for matching name string, then set its value down */
+			for (j = 0; j < p->mode_prop->count_enums; j++) {
+				if (!strcmp(p->mode_prop->enums[j].name, name)) {
+					ret = drmModeConnectorSetProperty(drmmode->fd,
+									  drmmode_output->output_id,
+									  p->mode_prop->prop_id,
+									  p->mode_prop->enums[j].value);
+
+					if (ret)
+						return FALSE;
+
+					return TRUE;
+				}
+			}
+
+			return FALSE;
+		}
 	}
 
-	return ret == 0;
+	return TRUE;
 }
 
 static const xf86OutputFuncsRec drmmode_output_funcs = {
-- 
1.6.3.3
