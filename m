From: okias <d.okias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: x8r8g8b8 fix after texformat-rework
Date: Thu, 29 Oct 2009 15:49:37 +0100
Message-ID: <c2673ca60910290749s50abeeddy8f8a0c526a7e8baf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=0015174760aa39a34704771405ac
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

--0015174760aa39a34704771405ac
Content-Type: text/plain; charset=UTF-8

This allow glxinfo to work without assert.

This patch add forgot XRGB8888 <> X8R8G8B8 conversion.

Signed-off-by: David Heidelberger <d.okias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

--- a/st_format.c	2009-10-29 15:39:21.778200092 +0100
+++ b/st_format.c	2009-10-29 15:33:08.150963668 +0100
@@ -218,6 +218,8 @@
    case MESA_FORMAT_ARGB8888_REV:
    case MESA_FORMAT_ARGB8888:
       return PIPE_FORMAT_A8R8G8B8_UNORM;
+   case MESA_FORMAT_XRGB8888:
+      return PIPE_FORMAT_X8R8G8B8_UNORM;
    case MESA_FORMAT_ARGB1555:
       return PIPE_FORMAT_A1R5G5B5_UNORM;
    case MESA_FORMAT_ARGB4444:
@@ -287,6 +289,8 @@
    switch (pipeFormat) {
    case PIPE_FORMAT_A8R8G8B8_UNORM:
       return MESA_FORMAT_ARGB8888;
+   case PIPE_FORMAT_X8R8G8B8_UNORM:
+      return MESA_FORMAT_XRGB8888;
    case PIPE_FORMAT_A1R5G5B5_UNORM:
       return MESA_FORMAT_ARGB1555;
    case PIPE_FORMAT_A4R4G4B4_UNORM:
@@ -698,6 +702,8 @@
    switch (format) {
    case PIPE_FORMAT_A8R8G8B8_UNORM:
       return MESA_FORMAT_ARGB8888;
+   case PIPE_FORMAT_X8R8G8B8_UNORM:
+      return MESA_FORMAT_XRGB8888;
    case PIPE_FORMAT_A1R5G5B5_UNORM:
       return MESA_FORMAT_ARGB1555;
    case PIPE_FORMAT_A4R4G4B4_UNORM:


-- 
Jabber/XMPP: okias-O1n184kmSCviB9QmIjCX8w@public.gmane.org
SIP VoIP: sip:17474537254-rne+wJe3e/u3Jhga2bR/9VaTQe2KTcn/@public.gmane.org

--0015174760aa39a34704771405ac
Content-Type: text/plain; charset=US-ASCII; name="add_X8R8G8B8.diff"
Content-Disposition: attachment; filename="add_X8R8G8B8.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g1dms0lz0

VGhpcyBwYXRjaCBhZGQgZm9yZ290IFhSR0I4ODg4IDw+IFg4UjhHOEI4IGNvbnZlcnNpb24uCgpT
aWduZWQtb2ZmLWJ5OiBEYXZpZCBIZWlkZWxiZXJnZXIgPGQub2tpYXNAZ21haWwuY29tPgoKLS0t
IGEvc3RfZm9ybWF0LmMJMjAwOS0xMC0yOSAxNTozOToyMS43NzgyMDAwOTIgKzAxMDAKKysrIGIv
c3RfZm9ybWF0LmMJMjAwOS0xMC0yOSAxNTozMzowOC4xNTA5NjM2NjggKzAxMDAKQEAgLTIxOCw2
ICsyMTgsOCBAQAogICAgY2FzZSBNRVNBX0ZPUk1BVF9BUkdCODg4OF9SRVY6CiAgICBjYXNlIE1F
U0FfRk9STUFUX0FSR0I4ODg4OgogICAgICAgcmV0dXJuIFBJUEVfRk9STUFUX0E4UjhHOEI4X1VO
T1JNOworICAgY2FzZSBNRVNBX0ZPUk1BVF9YUkdCODg4ODoKKyAgICAgIHJldHVybiBQSVBFX0ZP
Uk1BVF9YOFI4RzhCOF9VTk9STTsKICAgIGNhc2UgTUVTQV9GT1JNQVRfQVJHQjE1NTU6CiAgICAg
ICByZXR1cm4gUElQRV9GT1JNQVRfQTFSNUc1QjVfVU5PUk07CiAgICBjYXNlIE1FU0FfRk9STUFU
X0FSR0I0NDQ0OgpAQCAtMjg3LDYgKzI4OSw4IEBACiAgICBzd2l0Y2ggKHBpcGVGb3JtYXQpIHsK
ICAgIGNhc2UgUElQRV9GT1JNQVRfQThSOEc4QjhfVU5PUk06CiAgICAgICByZXR1cm4gTUVTQV9G
T1JNQVRfQVJHQjg4ODg7CisgICBjYXNlIFBJUEVfRk9STUFUX1g4UjhHOEI4X1VOT1JNOgorICAg
ICAgcmV0dXJuIE1FU0FfRk9STUFUX1hSR0I4ODg4OwogICAgY2FzZSBQSVBFX0ZPUk1BVF9BMVI1
RzVCNV9VTk9STToKICAgICAgIHJldHVybiBNRVNBX0ZPUk1BVF9BUkdCMTU1NTsKICAgIGNhc2Ug
UElQRV9GT1JNQVRfQTRSNEc0QjRfVU5PUk06CkBAIC02OTgsNiArNzAyLDggQEAKICAgIHN3aXRj
aCAoZm9ybWF0KSB7CiAgICBjYXNlIFBJUEVfRk9STUFUX0E4UjhHOEI4X1VOT1JNOgogICAgICAg
cmV0dXJuIE1FU0FfRk9STUFUX0FSR0I4ODg4OworICAgY2FzZSBQSVBFX0ZPUk1BVF9YOFI4RzhC
OF9VTk9STToKKyAgICAgIHJldHVybiBNRVNBX0ZPUk1BVF9YUkdCODg4ODsKICAgIGNhc2UgUElQ
RV9GT1JNQVRfQTFSNUc1QjVfVU5PUk06CiAgICAgICByZXR1cm4gTUVTQV9GT1JNQVRfQVJHQjE1
NTU7CiAgICBjYXNlIFBJUEVfRk9STUFUX0E0UjRHNEI0X1VOT1JNOgo=
--0015174760aa39a34704771405ac
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--0015174760aa39a34704771405ac--
