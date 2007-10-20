From: "Mark Carey" <mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Opps Was Re: [patch] [renouveau] 1/2 test_exa shouldn't
	be run on cards without ARB_texture_rectangle
Date: Sat, 20 Oct 2007 23:30:52 +1300
Message-ID: <34576580710200330l4e91a96bn884b170cda5e4b1c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----=_Part_9695_783005.1192876252389"
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

------=_Part_9695_783005.1192876252389
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

cvs checkout was stale and part of the patch hit the wrong place,
fixup attached.

------=_Part_9695_783005.1192876252389
Content-Type: text/x-diff; name=renouveau-opps.patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_f7zzp3mn
Content-Disposition: attachment; filename=renouveau-opps.patch

LS0tIHRlc3RzLmMub3JpZwkyMDA3LTEwLTIwIDIzOjI1OjIyLjAwMDAwMDAwMCArMTMwMAorKysg
dGVzdHMuYwkyMDA3LTEwLTIwIDIzOjI1OjU4LjAwMDAwMDAwMCArMTMwMApAQCAtNDY2OSwxNSAr
NDY2OSw2IEBACiAJLy8gKHBvcnRlZCB0byBTREwgYnkgU2FtIExhbnRpbmdhICcyMDAwKQogCWlu
dCBXaWR0aCA9IDY0MCwgSGVpZ2h0PTQ4MDsKIAotI2lmbmRlZiBHTF9BUkJfdGV4dHVyZV9yZWN0
YW5nbGUKLSAgICAgICAgcHJpbnRmKCIjIFNvcnJ5LCBubyBHTF9BUkJfdGV4dHVyZV9yZWN0YW5n
bGVcbiIpOwotI2Vsc2UKLQljb25zdCBjaGFyICpleHRlbnNpb25zID0gKGNvbnN0IGNoYXIgKily
ZWdsLkdldFN0cmluZyhHTF9FWFRFTlNJT05TKTsKLQlpZiAoIXN0cnN0cihleHRlbnNpb25zLCAi
R0xfQVJCX3RleHR1cmVfcmVjdGFuZ2xlIikpIHsKLQkJZnByaW50ZihzdGRlcnIsIk5vIEdMX0FS
Ql90ZXh0dXJlX3JlY3RhbmdsZSBleHRlbnNpb24uIik7Ci0JCXJldHVybjsKLQl9Ci0KIAlURVNU
X1BST0xPR1VFOwogCXByaW50ZigiIyB0ZXN0X25laGUwMigpXG4iKTsKIAlkdW1wX2JlZm9yZSgp
OwpAQCAtNDczMCw2ICs0NzIxLDE2IEBACiAgKi8KIHZvaWQgdGVzdF9leGEodm9pZCkKIHsKKwor
I2lmbmRlZiBHTF9BUkJfdGV4dHVyZV9yZWN0YW5nbGUKKyAgICAgICAgcHJpbnRmKCIjIFNvcnJ5
LCBubyBHTF9BUkJfdGV4dHVyZV9yZWN0YW5nbGVcbiIpOworI2Vsc2UKKwljb25zdCBjaGFyICpl
eHRlbnNpb25zID0gKGNvbnN0IGNoYXIgKilyZWdsLkdldFN0cmluZyhHTF9FWFRFTlNJT05TKTsK
KwlpZiAoIXN0cnN0cihleHRlbnNpb25zLCAiR0xfQVJCX3RleHR1cmVfcmVjdGFuZ2xlIikpIHsK
KwkJZnByaW50ZihzdGRlcnIsIk5vIEdMX0FSQl90ZXh0dXJlX3JlY3RhbmdsZSBleHRlbnNpb24u
Iik7CisJCXJldHVybjsKKwl9CisKIAlURVNUX1BST0xPR1VFOwogCUdMdWludCBzY3JlZW5fdGV4
bnVtLG1vZHVsYXRlX3RleG51bTsKIAo=
------=_Part_9695_783005.1192876252389
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

------=_Part_9695_783005.1192876252389--
