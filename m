From: "Stephane Marchesin" <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Subject: Re: geforce 4 mx + 2.6.22 problem
Date: Wed, 10 Oct 2007 16:05:50 +0200
Message-ID: <6a89f9d50710100705p4859135fk5695cc25d4d69491@mail.gmail.com>
References: <740972.68851.qm@web27715.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2009058109=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <740972.68851.qm-K0wZUJctTzjGRxTy+Q50vsz6deESKz/lQQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============2009058109==
Content-Type: multipart/alternative;
	boundary="----=_Part_50564_4221854.1192025150555"

------=_Part_50564_4221854.1192025150555
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/10/07, Pietro Capriata <kpietro-whZMOeQn8C0@public.gmane.org> wrote:
>
> I have update my source with git , but i have also problem ..
>
> i post my X log and Kern log
>
> Thank you very much to help me !
>


Hello,

These logs (at least the DRM part) seem like they have been generated with
the older version of the DRM. The current version doesn't output messages in
the same format.
That probably means your DRM module is not properly
updated/compiled/installed.

Stephane

PS: Could you please put those logs online and paste a url instead of
attaching them ?

------=_Part_50564_4221854.1192025150555
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<br><div><span class="gmail_quote">On 10/10/07, <b class="gmail_sendername">Pietro Capriata</b> &lt;<a href="mailto:kpietro-whZMOeQn8C0@public.gmane.org">kpietro-whZMOeQn8C0@public.gmane.org</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
<div><div style="font-family: times new roman,new york,times,serif; font-size: 12pt;"><div style="font-family: times new roman,new york,times,serif; font-size: 12pt;">I have update my source with git , but i have also problem ..
<br><br>i post my X log and Kern log<br><br>Thank you very much to help me !</div></div></div></blockquote><div><br>&nbsp;<span class="ppt" id="_user_nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org"></span></div><div>Hello,<br><br>These logs (at least the DRM part) seem like they have been generated with the older version of the DRM. The current version doesn&#39;t output messages in the same format.
<br>That probably means your DRM module is not properly updated/compiled/installed.<br><br>Stephane<br><br>PS: Could you please put those logs online and paste a url instead of attaching them ?<br><br></div></div>

------=_Part_50564_4221854.1192025150555--

--===============2009058109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2009058109==--
