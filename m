From: okias <d.okias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: wfb: fix nouveau_wfb_finish_wrap
Date: Wed, 24 Jun 2009 22:04:17 +0200
Message-ID: <c2673ca60906241304w2f814530ge1c2ad0c720337d6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=0016363ba65cb88783046d1d9cd8
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

--0016363ba65cb88783046d1d9cd8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Here is patch, which fixing bug 22253.

-- 
Jabber/XMPP: okias-O1n184kmSCviB9QmIjCX8w@public.gmane.org
SIP VoIP: sip:17474537254-rne+wJe3e/u3Jhga2bR/9VaTQe2KTcn/@public.gmane.org

--0016363ba65cb88783046d1d9cd8
Content-Type: application/octet-stream; name="WFB_FIX.patch"
Content-Disposition: attachment; filename="WFB_FIX.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fwch3z2m0

ZGlmZiAtcnVwTiBhL25vdXZlYXVfd2ZiLmMgYi9ub3V2ZWF1X3dmYi5jCi0tLSBhL25vdXZlYXVf
d2ZiLmMJMjAwOS0wNi0yNCAyMTo1ODo0Mi41ODM0MDM2MzQgKzAyMDAKKysrIGIvbm91dmVhdV93
ZmIuYwkyMDA5LTA2LTI0IDIxOjU5OjAzLjIxMzA5NzQ4MyArMDIwMApAQCAtMTc1LDIwICsxNzUs
MjEgQEAgbm91dmVhdV93ZmJfc2V0dXBfd3JhcChSZWFkTWVtb3J5UHJvY1B0cgogdm9pZAogbm91
dmVhdV93ZmJfZmluaXNoX3dyYXAoRHJhd2FibGVQdHIgcERyYXcpCiB7Ci0Jc3RydWN0IHdmYl9w
aXhtYXAgKndmYiA9ICZ3ZmJfcGl4bWFwWzBdOworCXN0cnVjdCB3ZmJfcGl4bWFwICp3ZmI7CiAJ
UGl4bWFwUHRyIHBwaXg7Ci0JaW50IGk7CisJaW50IGksd3JhcDsKIAogCXBwaXggPSBOVkdldERy
YXdhYmxlUGl4bWFwKHBEcmF3KTsKIAlpZiAoIXBwaXgpCiAJCXJldHVybjsKIAotCWZvciAoaSA9
IDA7IGkgPCA2OyBpKyspIHsKLQkJaWYgKHdmYi0+cHBpeCAhPSBwcGl4KQotCQkJY29udGludWU7
CisJd2ZiID0gJndmYl9waXhtYXBbMF07CiAKKwl3cmFwID0gMDsKKwl3aGlsZSh3ZmJfcGl4bWFw
W3dyYXBdLnBwaXgpIHsKKwkJd2ZiID0gJndmYl9waXhtYXBbd3JhcF07CiAJCXdmYi0+cHBpeCA9
IE5VTEw7Ci0JCWJyZWFrOworCQl3cmFwKys7CiAJfQogfQogCg==
--0016363ba65cb88783046d1d9cd8
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--0016363ba65cb88783046d1d9cd8--
