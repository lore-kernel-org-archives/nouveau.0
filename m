From: "Mark Carey" <mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] [renouveau] 1/2 test_exa shouldn't be run on
	cards without ARB_texture_rectangle
Date: Sat, 20 Oct 2007 23:05:03 +1300
Message-ID: <34576580710200305h5be6a7cbo37550bcbc38b36f8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_9640_30984095.1192874703966"
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

------=_Part_9640_30984095.1192874703966
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

NV5 doesnt like test_exa due to missing ARB_texture_rectangle so make
sure test_exa is not run on this card

------=_Part_9640_30984095.1192874703966
Content-Type: text/x-diff;
 name=renouveau-dont-run-test-exa-on-cards-without-ARB_texture_rectangle.patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_f7zyr10u
Content-Disposition: attachment;
 filename=renouveau-dont-run-test-exa-on-cards-without-ARB_texture_rectangle.patch

LS0tIHRlc3RzLmMub3JnCTIwMDctMTAtMjAgMjI6NTQ6NDAuMDAwMDAwMDAwICsxMzAwCisrKyB0
ZXN0cy5jCTIwMDctMTAtMjAgMjI6NTU6MTcuMDAwMDAwMDAwICsxMzAwCkBAIC00NzIyLDYgKzQ3
MjIsMTUgQEAKIHZvaWQgdGVzdF9leGEodm9pZCkKIHsKIAorI2lmbmRlZiBHTF9BUkJfdGV4dHVy
ZV9yZWN0YW5nbGUKKyAgICAgICAgcHJpbnRmKCIjIFNvcnJ5LCBubyBHTF9BUkJfdGV4dHVyZV9y
ZWN0YW5nbGVcbiIpOworI2Vsc2UKKwljb25zdCBjaGFyICpleHRlbnNpb25zID0gKGNvbnN0IGNo
YXIgKilyZWdsLkdldFN0cmluZyhHTF9FWFRFTlNJT05TKTsKKwlpZiAoIXN0cnN0cihleHRlbnNp
b25zLCAiR0xfQVJCX3RleHR1cmVfcmVjdGFuZ2xlIikpIHsKKwkJZnByaW50ZihzdGRlcnIsIk5v
IEdMX0FSQl90ZXh0dXJlX3JlY3RhbmdsZSBleHRlbnNpb24uIik7CisJCXJldHVybjsKKwl9CisK
IAlURVNUX1BST0xPR1VFOwogCUdMdWludCBzY3JlZW5fdGV4bnVtLG1vZHVsYXRlX3RleG51bTsK
IApAQCAtNDgyNCw0ICs0ODMzLDUgQEAKIAlkdW1wX2FmdGVyKDApOwogCXByaW50ZigiIyBibGl0
dGluZyBva1xuIik7CiAJVEVTVF9FUElMT0dVRTsKKyNlbmRpZgogfQo=
------=_Part_9640_30984095.1192874703966
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

------=_Part_9640_30984095.1192874703966--
