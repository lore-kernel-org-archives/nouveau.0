From: "Mark Carey" <mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] [renouveau] 2/2 Makefile does not clean up after
	itself confusing cvs update
Date: Sat, 20 Oct 2007 23:06:53 +1300
Message-ID: <34576580710200306w72f080f0m252d48755100ac14@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_9644_27372473.1192874813624"
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

------=_Part_9644_27372473.1192874813624
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Makefile needs to be updated to remove renouveau-gen renouveau-replay
both recent additions.  As these are not cleaned away cvs update warns
of their presence.

------=_Part_9644_27372473.1192874813624
Content-Type: text/x-diff;
 name=renouveau-update-makefile-for-replay-gen.patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_f7zyu2jr
Content-Disposition: attachment;
 filename=renouveau-update-makefile-for-replay-gen.patch

LS0tIE1ha2VmaWxlLm9yZwkyMDA3LTEwLTIwIDIyOjQ5OjM5LjAwMDAwMDAwMCArMTMwMAorKysg
TWFrZWZpbGUJMjAwNy0xMC0yMCAyMjo1MDo1Ny4wMDAwMDAwMDAgKzEzMDAKQEAgLTcyLDcgKzcy
LDggQEAKIAogY2xlYW46CiAJcm0gLWYgJChUQVJHRVQpIC5kZXBlbmQgKi5vIGRpc2FzbV9zaGFk
ZXIgXAotCQlnZW4gbm91dmVhdV9yZWcuaCByZW5vdXZlYXUtcGFyc2UgcGFyc2Utb2JqZWN0cwor
CQlyZW5vdXZlYXUtZ2VuIG5vdXZlYXVfcmVnLmggcmVub3V2ZWF1LXBhcnNlIHBhcnNlLW9iamVj
dHMgXAorCQlyZW5vdXZlYXUtcmVwbGF5CiAKIGRlcDogLmRlcGVuZAogCg==
------=_Part_9644_27372473.1192874813624
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

------=_Part_9644_27372473.1192874813624--
