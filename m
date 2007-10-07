From: "Stephane Marchesin" <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Subject: Re: geforce 4 mx + 2.6.22 problem
Date: Mon, 8 Oct 2007 00:47:08 +0200
Message-ID: <6a89f9d50710071547i5601fd81k8c9c6507231d2ff1@mail.gmail.com>
References: <888342.24525.qm@web27709.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_42862_22786822.1191797228387"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <888342.24525.qm-G4tg1C52IL/GRxTy+Q50vsz6deESKz/lQQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pietro Capriata <kpietro-whZMOeQn8C0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

------=_Part_42862_22786822.1191797228387
Content-Type: multipart/alternative;
	boundary="----=_Part_42863_10731884.1191797228387"

------=_Part_42863_10731884.1191797228387
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/8/07, Pietro Capriata <kpietro-whZMOeQn8C0@public.gmane.org> wrote:
>
> and put this message
>
> DMA queque hang: dmaPut=1ffb, current=0, status=0
>

Could you try with that patch, and send us the dmesg again ? I suspect a
register access endianness issue here...

Stephane

------=_Part_42863_10731884.1191797228387
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<br><br><div><span class="gmail_quote">On 10/8/07, <b class="gmail_sendername">Pietro Capriata</b> &lt;<a href="mailto:kpietro-whZMOeQn8C0@public.gmane.org">kpietro-whZMOeQn8C0@public.gmane.org</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
<div><div style="font-family: times new roman,new york,times,serif; font-size: 12pt;"><div style="font-size: 12pt;">and put this message<br><br>DMA queque hang: dmaPut=1ffb, current=0, status=0<br></div></div></div></blockquote>
</div><br>Could you try with that patch, and send us the dmesg again ? I suspect a register access endianness issue here...<br><br>Stephane<br><br>

------=_Part_42863_10731884.1191797228387--

------=_Part_42862_22786822.1191797228387
Content-Type: application/octet-stream; name="diff"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="diff"
X-Attachment-Id: f_f7i58l5l

ZGlmZiAtLWdpdCBhL3NoYXJlZC1jb3JlL25vdXZlYXVfc3RhdGUuYyBiL3NoYXJlZC1jb3JlL25v
dXZlYXVfc3RhdGUuYwppbmRleCBmZDgwZTFlLi5jOTBmYTI5IDEwMDY0NAotLS0gYS9zaGFyZWQt
Y29yZS9ub3V2ZWF1X3N0YXRlLmMKKysrIGIvc2hhcmVkLWNvcmUvbm91dmVhdV9zdGF0ZS5jCkBA
IC00NTgsNiArNDU4LDcgQEAgaW50IG5vdXZlYXVfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LCB1bnNpZ25lZCBsb25nIGZsYWdzKQogCX0KIAogCURSTV9JTkZPKCJEZXRlY3RlZCBhbiBOViVk
IGdlbmVyYXRpb24gY2FyZFxuIiwgZGV2X3ByaXYtPmNhcmRfdHlwZSk7CisJRFJNX0lORk8oIkhX
IGlkIGlzIDB4JXhcbiIsIHJlZzApOwogCiAJaWYgKGRldl9wcml2LT5jYXJkX3R5cGUgPT0gTlZf
VU5LTk9XTikgewogCQlyZXR1cm4gLUVJTlZBTDsK
------=_Part_42862_22786822.1191797228387
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

------=_Part_42862_22786822.1191797228387--
