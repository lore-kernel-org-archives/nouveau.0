From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 2/2] man page: Comment some output properties.
Date: Mon, 24 Aug 2009 16:03:58 +0200
Message-ID: <1251122638-17936-2-git-send-email-currojerez@riseup.net>
References: <1251122638-17936-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1251122638-17936-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 man/nouveau.man |   52 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/man/nouveau.man b/man/nouveau.man
index 5c4e4ae..f591459 100644
--- a/man/nouveau.man
+++ b/man/nouveau.man
@@ -84,13 +84,61 @@ tells to the driver to scale lower resolutions up to the flat panel's native
 resolution.  Default: on.
 .TP 
 .BI "Option \*qScalingMode\*q \*q" string \*q 
-Only for the randr-1.2 driver, this allows to set the DFP scaling mode.
+This allows to set the DFP scaling mode.
 The options are "fullscreen", "aspect", "noscale" and "panel". Default: "aspect".
 .TP
 .BI "Option \*qShadowFB\*q \*q" boolean \*q
 Enable or disable use of the shadow framebuffer layer.  Default: off.
+
+.SH OUTPUT CONFIGURATION
+Multihead configuration is done through the RandR1.2 interface (see
+__xconfigfile__(__filemansuffix__) and xrandr(__appmansuffix__) for
+details). The following output properties may be available (depending
+on what chip model is being used. You can use xrandr(__appmansuffix__)
+to get a list of the allowed properties and ranges):
+.SS DVI-I and TV outputs
+.TP
+.B subconnector
+reports what kind of connector was detected to be plugged in.
+It can be something like
+.BR DVI-D " or " DVI-A " for " DVI-I " outputs, "
+.RB "and something like " Composite ", " SVIDEO ", " Component " or " SCART
+.RB "for " TV " outputs."
+.TP
+.B select subconnector
+allows the user to override the autodetected
+.B subconnector
+setting.
+.SS DVI-I, DVI-D and LVDS outputs
+.TP
+.B dithering, scaling mode
+Analogous to the
+.BR FPDither " and " FPScale
+config file options explained above.
+.SS TV outputs
+.TP
+.B mode
+selects which TV norm will be used. Note that the TV output has to be
+turned off before this can be modified. If you want a system-wide
+default for this, use the
+.B tv_norm
+option of the TV encoder driver you're using (If no external TV
+encoder is being used, that's the \*qnouveau\*q kernel module).
+.TP
+.B overscan
+controls how much of the screen margins will be left unused and black.
+.TP
+.B scale
+Only used for TV encoders with fixed rescaler units that require
+different video modes for different scaling ratios. A bigger
+.B scale
+value usually means a bigger output image. Note that the TV output has
+to be turned off before modifying this, just like the
+.B mode
+property.
+
 .SH "SEE ALSO"
-__xservername__(__appmansuffix__), __xconfigfile__(__filemansuffix__), Xserver(__appmansuffix__), X(__miscmansuffix__)
+__xservername__(__appmansuffix__), __xconfigfile__(__filemansuffix__), Xserver(__appmansuffix__), X(__miscmansuffix__), xrandr(__appmansuffix__)
 .SH AUTHORS
 Authors include: David McKay, Jarno Paananen, Chas Inman, Dave Schmenk, 
 Mark Vojkovich
-- 
1.6.3.3
