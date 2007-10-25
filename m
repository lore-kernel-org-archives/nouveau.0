From: "Mark Carey" <mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] [renouveau] 1/1 fix detection of
	GL_ARB_draw_buffers in test_framebuffer_object
Date: Thu, 25 Oct 2007 22:35:57 +1300
Message-ID: <34576580710250235i43117e4g793cf4e6eeb7529c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_708_13729314.1193304957339"
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

------=_Part_708_13729314.1193304957339
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Further to comments in
http://people.freedesktop.org/~marcheu/irclogs/nouveau-2007-10-20
between 11:30 and 13:51, chowmeined confirmation in
http://people.freedesktop.org/~marcheu/irclogs/nouveau-2007-10-21 at
10:16 of the same behaviour on a second 0322.

It appears that 10de0322 supports GL_EXT_framebuffer_object but does
not support ARB_draw_buffers, accordingly the current fragment program
in renouveau test.c::test_ext_framebuffer_object() causes OpenGL error
1282, 502, INVALID_OPERATION at call to ProgramStringARB on line 4595,
http://oss.sgi.com/projects/ogl-sample/registry/ARB/fragment_program.txt
section 3.11.1 suggests this is due to the illegal token in the
fragment program (fp).

The example code in
http://oss.sgi.com/projects/ogl-sample/registry/ARB/fragment_program.txt
between lines 417 and 429 suggest a method for determining which
character in the fragment program caused the error;

	GLint errorPos;
	regl.GetIntegerv(GL_PROGRAM_ERROR_POSITION_ARB, &errorPos);

Error appears to be firstly `OPTION ARB_draw_buffers;` and secondly
the use of `MOV result.color[%d], fragment.color;` when without
GL_ARB_draw_buffers a syntactically correct line woudl read `MOV
result.color, fragment.color;`.

Furthermore due to incorrect detection of nr_bufs line 4614 or 4615
causes a similar error when the draw buffers test attempts to use a
draw buffer which does not exist on the hardware.

Perusing http://oss.sgi.com/projects/ogl-sample/registry/ARB/draw_buffers.txt
when querying the number of supported draw buffers one should call
GetIntegerv specifying MAX_DRAW_BUFFERS_ARB (0x8824) not
GL_MAX_COLOR_ATTACHMENTS_EXT as currently performed on line 4566.

Attached patch;

1. Defines the constant MAX_DRAW_BUFFERS_ARB (in test.c, which header
should this go into? does it really matter for renouveau?)
2. Correctly uses MAX_DRAW_BUFFERS_ARB to determine the number of draw
buffers present
(http://oss.sgi.com/projects/ogl-sample/registry/ARB/draw_buffers.txt
suggests that OpenGL 1.5 MAX_DRAW_BUFFERS_ARB will always return a
minimum value of 1, will renouveau ever be run on OpenGL<1.5?)
3. Adds a line to `card_10de-xxxx_test_ext_framebuffer_object.txt`
when GL_ARB_draw_buffers is not supported
4. Modifies the fp in the case when MAX_DRAW_BUFFERS_ARB == 1 and
GL_ARB_draw_buffers is not supported
5. Draw buffer test now runs without error (due to 2)

Patch applied to a fresh checkout of renouveau on both 0322
(GL_EXT_framebuffer_object) and 0393 (GL_EXT_framebuffer_object +
GL_ARB_draw_buffers) compiled and tested without error.

Please review and consider applying the attached patch.

Regards,

Mark Carey

------=_Part_708_13729314.1193304957339
Content-Type: text/x-diff; name=0322-fix-test-framebuffer-object.patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_f872wxvw
Content-Disposition: attachment;
 filename=0322-fix-test-framebuffer-object.patch

LS0tIHJlbm91dmVhdS90ZXN0cy5jLm9yaWcJMjAwNy0xMC0yNSAyMToyNjoxNi4wMDAwMDAwMDAg
KzEzMDAKKysrIHJlbm91dmVhdS90ZXN0cy5jCTIwMDctMTAtMjUgMjE6NDI6NTQuMDAwMDAwMDAw
ICsxMzAwCkBAIC00NTYzLDggKzQ1NjMsMTIgQEAKIAogCVRFU1RfUFJPTE9HVUU7CiAKLQlyZWds
LkdldEludGVnZXJ2KEdMX01BWF9DT0xPUl9BVFRBQ0hNRU5UU19FWFQsICZucl9idWZzKTsKKy8q
IGRlZmluZWQgYXMgcGVyIGh0dHA6Ly9vc3Muc2dpLmNvbS9wcm9qZWN0cy9vZ2wtc2FtcGxlL3Jl
Z2lzdHJ5L0FSQi9kcmF3X2J1ZmZlcnMudHh0ICovCisjZGVmaW5lIE1BWF9EUkFXX0JVRkZFUlNf
QVJCIDB4ODgyNCAKKwlyZWdsLkdldEludGVnZXJ2KE1BWF9EUkFXX0JVRkZFUlNfQVJCLCAmbnJf
YnVmcyk7CiAJcHJpbnRmKCIjICVkIGRyYXcgYnVmZmVycyBzdXBwb3J0ZWRcbiIsIG5yX2J1ZnMp
OworCWlmIChucl9idWZzID09IDEgJiYgIXN0cnN0cihleHRlbnNpb25zLCAiR0xfQVJCX2RyYXdf
YnVmZmVycyIpKQorCQlwcmludGYoIiMgTm8gR0xfQVJCX2RyYXdfYnVmZmVycyBleHRlbnNpb25c
biIpOwogCWlmIChucl9idWZzID4gUkVOT1VWRUFVX01BWF9EUkFXX0JVRkZFUlMpCiAJCW5yX2J1
ZnMgPSBSRU5PVVZFQVVfTUFYX0RSQVdfQlVGRkVSUzsKIApAQCAtNDU3OCwyMyArNDU4MiwzNCBA
QAogCSAgICByZWdsLlJlbmRlcmJ1ZmZlclN0b3JhZ2VFWFQoR0xfUkVOREVSQlVGRkVSX0VYVCwg
R0xfUkdCQSwgMzIsIDMyKTsKIAl9CiAJcmVnbC5HZW5Qcm9ncmFtc0FSQihSRU5PVVZFQVVfTUFY
X0RSQVdfQlVGRkVSUywgZnBfb2JqKTsKLQlmb3IgKGk9MDsgaTxucl9idWZzOyBpKyspIHsKLQkJ
aW50IGJ1ZjsKLQorCWlmIChucl9idWZzID09IDEgJiYgIXN0cnN0cihleHRlbnNpb25zLCAiR0xf
QVJCX2RyYXdfYnVmZmVycyIpKSB7CisJCS8qIGNhcmRzIHdpdGggR0xfRVhUX2ZyYW1lYnVmZmVy
X29iamVjdCBhbmQgbm8gR0xfQVJCX2RyYXdfYnVmZmVycyAwMzIyICovCiAJCWZwWzBdID0gJ1ww
JzsKLQkJc3RyY2F0KGZwLCAiISFBUkJmcDEuMFxuT1BUSU9OIEFSQl9kcmF3X2J1ZmZlcnM7XG4i
KTsKLQkJZm9yIChidWY9MDsgYnVmPD1pOyBidWYrKykgewotCQkJY2hhciBsWzEwMF07Ci0JCQlz
cHJpbnRmKGwsICJNT1YgcmVzdWx0LmNvbG9yWyVkXSwgZnJhZ21lbnQuY29sb3I7XG4iLCBidWYp
OwotCQkJc3RyY2F0KGZwLCBsKTsKLQkJCi0JCX0KLQkJc3RyY2F0KGZwLCAiRU5EXG4iKTsKKwkJ
c3RyY2F0KGZwLCAiISFBUkJmcDEuMFxuTU9WIHJlc3VsdC5jb2xvciwgZnJhZ21lbnQuY29sb3I7
XG5FTkRcbiIpOwogCQlwcmludGYoIiMgRnJhZ3Byb2cgaXM6XG4lc1xuIiwgZnApOwotCQlyZWds
LkJpbmRQcm9ncmFtQVJCKEdMX0ZSQUdNRU5UX1BST0dSQU1fQVJCLCBmcF9vYmpbaV0pOworCQly
ZWdsLkJpbmRQcm9ncmFtQVJCKEdMX0ZSQUdNRU5UX1BST0dSQU1fQVJCLCBmcF9vYmpbMF0pOwog
CQlyZWdsLlByb2dyYW1TdHJpbmdBUkIoR0xfRlJBR01FTlRfUFJPR1JBTV9BUkIsCiAJCQkJICAg
ICAgR0xfUFJPR1JBTV9GT1JNQVRfQVNDSUlfQVJCLAogCQkJCSAgICAgIHN0cmxlbihmcCksIGZw
KTsKKwl9IGVsc2UgeworCQlmb3IgKGk9MDsgaTxucl9idWZzOyBpKyspIHsKKwkJCWludCBidWY7
CisKKwkJCWZwWzBdID0gJ1wwJzsKKwkJCXN0cmNhdChmcCwgIiEhQVJCZnAxLjBcbk9QVElPTiBB
UkJfZHJhd19idWZmZXJzO1xuIik7CisJCQlmb3IgKGJ1Zj0wOyBidWY8PWk7IGJ1ZisrKSB7CisJ
CQkJY2hhciBsWzEwMF07CisJCQkJc3ByaW50ZihsLCAiTU9WIHJlc3VsdC5jb2xvclslZF0sIGZy
YWdtZW50LmNvbG9yO1xuIiwgYnVmKTsKKwkJCQlzdHJjYXQoZnAsIGwpOworCQkKKwkJCX0KKwkJ
CXN0cmNhdChmcCwgIkVORFxuIik7CisJCQlwcmludGYoIiMgRnJhZ3Byb2cgaXM6XG4lc1xuIiwg
ZnApOworCQkJcmVnbC5CaW5kUHJvZ3JhbUFSQihHTF9GUkFHTUVOVF9QUk9HUkFNX0FSQiwgZnBf
b2JqW2ldKTsKKwkJCXJlZ2wuUHJvZ3JhbVN0cmluZ0FSQihHTF9GUkFHTUVOVF9QUk9HUkFNX0FS
QiwKKwkJCQkJICAgICAgR0xfUFJPR1JBTV9GT1JNQVRfQVNDSUlfQVJCLAorCQkJCQkgICAgICBz
dHJsZW4oZnApLCBmcCk7CisJCX0KIAl9CiAJcmVnbC5GaW5pc2goKTsKIAo=
------=_Part_708_13729314.1193304957339
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

------=_Part_708_13729314.1193304957339--
