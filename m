From: "Stephane Marchesin" <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Subject: Re: [PATCH] G72 doesn't need ExaCopy workaround
Date: Sat, 20 Oct 2007 14:31:11 +0200
Message-ID: <6a89f9d50710200531q74e7bac5x91d211b7adc5d512@mail.gmail.com>
References: <20071020111904.GA16500@singular.local>
	<6d4bc9fc0710200513g32749468gdbab370387925143@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2147087213=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc0710200513g32749468gdbab370387925143-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============2147087213==
Content-Type: multipart/alternative;
	boundary="----=_Part_8223_3938579.1192883471935"

------=_Part_8223_3938579.1192883471935
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/20/07, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> It's entirely possible that your card does not have the bug.


Yeah, we don't know precisely under what circumstances it's triggered. It
seems to be related to texture data caching somehow, but that's all we know.


Maybe i can figure out what the original card was with this issue.
>
> Anyone else have an opinion on how to deal with this? (remove the
> single entry, or try to narrow it down even further, etc)


We could try to use the 3D engine to do copies on nv40, provided there's no
issue with texture caching when doing copies to/from the same surface.

Of course, the best solution is to look at how nvidia implement this.

Stephane

------=_Part_8223_3938579.1192883471935
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<br><br><div><span class="gmail_quote">On 10/20/07, <b class="gmail_sendername">Maarten Maathuis</b> &lt;<a href="mailto:madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
It&#39;s entirely possible that your card does not have the bug.</blockquote><div><br>Yeah, we don&#39;t know precisely under what circumstances it&#39;s triggered. It seems to be related to texture data caching somehow, but that&#39;s all we know.
<br><br></div><br><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">Maybe i can figure out what the original card was with this issue.<br><br>
Anyone else have an opinion on how to deal with this? (remove the<br>single entry, or try to narrow it down even further, etc)</blockquote><div><br>We could try to use the 3D engine to do copies on nv40, provided there&#39;s no issue with texture caching when doing copies to/from the same surface.
<br><br>Of course, the best solution is to look at how nvidia implement this.<br><br>Stephane<br></div></div><br>

------=_Part_8223_3938579.1192883471935--

--===============2147087213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2147087213==--
