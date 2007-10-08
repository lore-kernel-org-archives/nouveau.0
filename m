From: "Stephane Marchesin" <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Subject: Re: XRandR 180
Date: Mon, 8 Oct 2007 15:57:00 +0200
Message-ID: <6a89f9d50710080657l7630415ctb9efc30b0d86ee08@mail.gmail.com>
References: <816bc7510710080112x5faa57afjb9fc87b9d2a075d3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0390833305=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <816bc7510710080112x5faa57afjb9fc87b9d2a075d3-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Justin Dugger <jldugger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0390833305==
Content-Type: multipart/alternative;
	boundary="----=_Part_35731_24526288.1191851820204"

------=_Part_35731_24526288.1191851820204
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/8/07, Justin Dugger <jldugger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Hi,
>
> Does the current tree implement Rotate 180? I can see 0, 90 and 270,
> but not 180.  This feature might sound silly at first glance, but it
> happens to be highly useful for my convertible tablet laptop.  I've
> browsed the current nv code and nouveau implementations, and it's
> pretty clear that the older xrandr implementation did not do this.  Is
> there some secret in xrandr1.2 that I'm not seeing, or is the function
> also lacking in the current tree?
>
> This change seems like a fairly simple 20-ish line of code patch to
> support an additional rotation mode, but there's one thing I'm not
> clear on: does pNV map to some register in hardware, or is it simply a
> global state for the driver itself?
>

Hello

Our plan is a bit longer term than that. We want to implement hw accelerated
rotate support through randr + EXA. On the minus side, it's not a 10-line
job and requires us finishing up EXA composite() hookrs properly, but on the
plus side, it'll be hw accelerated.

Stephane

------=_Part_35731_24526288.1191851820204
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<br><br><div><span class="gmail_quote">On 10/8/07, <b class="gmail_sendername">Justin Dugger</b> &lt;<a href="mailto:jldugger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">jldugger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
Hi,<br><br>Does the current tree implement Rotate 180? I can see 0, 90 and 270,<br>but not 180.&nbsp;&nbsp;This feature might sound silly at first glance, but it<br>happens to be highly useful for my convertible tablet laptop.&nbsp;&nbsp;I&#39;ve
<br>browsed the current nv code and nouveau implementations, and it&#39;s<br>pretty clear that the older xrandr implementation did not do this.&nbsp;&nbsp;Is<br>there some secret in xrandr1.2 that I&#39;m not seeing, or is the function
<br>also lacking in the current tree?<br><br>This change seems like a fairly simple 20-ish line of code patch to<br>support an additional rotation mode, but there&#39;s one thing I&#39;m not<br>clear on: does pNV map to some register in hardware, or is it simply a
<br>global state for the driver itself?<br></blockquote></div><br>Hello<br><br>Our plan is a bit longer term than that. We want to implement hw accelerated rotate support through randr + EXA. On the minus side, it&#39;s not a 10-line job and requires us finishing up EXA composite() hookrs properly, but on the plus side, it&#39;ll be hw accelerated.
<br><br>Stephane<br><br>

------=_Part_35731_24526288.1191851820204--

--===============0390833305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0390833305==--
