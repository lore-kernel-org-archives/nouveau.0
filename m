From: Stephane Marchesin <stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: RFC: bicubic filtering patch
Date: Sun, 28 Mar 2010 23:57:31 -0700
Message-ID: <6a89f9d51003282357v6ba72c78je1d71efe2d01e1ce@mail.gmail.com>
References: <1269845640.2472.6.camel@nisroch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2054895799=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1269845640.2472.6.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============2054895799==
Content-Type: multipart/alternative; boundary=0016e68fd0ade050050482eb06b9

--0016e68fd0ade050050482eb06b9
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Mar 28, 2010 at 23:54, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hey,
>
> There's one relevant patch in the F13 DDX package that hasn't been
> pushed into git still.
>
> The patch simply switches off the bicubic filtering if we're scaling the
> image by less than 200% in either direction in order to prevent some
> excessive blurriness in the image (very noticable with the gstreamer
> xvideo test).
>
> The patch has been in the Fedora package since F11 as a user reported
> the issue as a bug, and the radeon driver has similar code, but I
> thought I'd ask for opinions before I pushed this to git.
>
>

Yup, that code was never intended for <2x scaling.

Stephane

--0016e68fd0ade050050482eb06b9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Sun, Mar 28, 2010 at 23:54, Ben Skegg=
s <span dir=3D"ltr">&lt;<a href=3D"mailto:skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">skeggsb@gmail.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"bor=
der-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-=
left: 1ex;">
Hey,<br>
<br>
There&#39;s one relevant patch in the F13 DDX package that hasn&#39;t been<=
br>
pushed into git still.<br>
<br>
The patch simply switches off the bicubic filtering if we&#39;re scaling th=
e<br>
image by less than 200% in either direction in order to prevent some<br>
excessive blurriness in the image (very noticable with the gstreamer<br>
xvideo test).<br>
<br>
The patch has been in the Fedora package since F11 as a user reported<br>
the issue as a bug, and the radeon driver has similar code, but I<br>
thought I&#39;d ask for opinions before I pushed this to git.<br>
<font color=3D"#888888"><br></font></blockquote><div><br><br>Yup, that code=
 was never intended for &lt;2x scaling.<br><br>Stephane<br></div></div><br>

--0016e68fd0ade050050482eb06b9--

--===============2054895799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2054895799==--
