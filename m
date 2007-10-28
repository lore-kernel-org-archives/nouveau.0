From: "Stephane Marchesin" <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Subject: Re: Oops with Nouveau on amd64 with nv15 card and kernel
	2.6.22 (debian sid)
Date: Sun, 28 Oct 2007 19:11:00 +0100
Message-ID: <6a89f9d50710281111n243e3019m5f7ecd8ec0171cc4@mail.gmail.com>
References: <1193510282.6740.5.camel@pc1.myname.nl>
	<6a89f9d50710271702x2c305fd3h4bb8e19315a0f8c5@mail.gmail.com>
	<1193577097.21380.6.camel@pc1.myname.nl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2027171375=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1193577097.21380.6.camel-y+udVmgIGs16khWGM0LCIA@public.gmane.org>
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
To: Daniel van Eeden <daniel.van.eeden-dAMBqdhANRhmR6Xm/wNWPw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============2027171375==
Content-Type: multipart/alternative;
	boundary="----=_Part_11833_30252146.1193595061000"

------=_Part_11833_30252146.1193595061000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/28/07, Daniel van Eeden <daniel.van.eeden-dAMBqdhANRhmR6Xm/wNWPw@public.gmane.org> wrote:
>
> Stephane,
>
> Thanks for the quick response.
>
> I've tried today's git and the Oops went away. drm and nouveau are
> working. :)
>
> I tried mesa, but that failed with the following error (backtrace is
> attached)


It's expected. We're going to do a proper 3D driver soon, anyway ATM you
would only be able to run glxgears on it...

Stephane

------=_Part_11833_30252146.1193595061000
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/28/07, <b class="gmail_sendername">Daniel van Eeden</b> &lt;<a href="mailto:daniel.van.eeden-dAMBqdhANRhmR6Xm/wNWPw@public.gmane.org">daniel.van.eeden-dAMBqdhANRhmR6Xm/wNWPw@public.gmane.org</a>&gt; wrote:<div><span class="gmail_quote"></span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
Stephane,<br><br>Thanks for the quick response.<br><br>I&#39;ve tried today&#39;s git and the Oops went away. drm and nouveau are<br>working. :)<br><br>I tried mesa, but that failed with the following error (backtrace is<br>
attached)</blockquote><div><br>It&#39;s expected. We&#39;re going to do a proper 3D driver soon, anyway ATM you would only be able to run glxgears on it...<br><br></div></div>Stephane<br><br>

------=_Part_11833_30252146.1193595061000--

--===============2027171375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2027171375==--
