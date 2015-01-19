From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Mon, 19 Jan 2015 15:58:59 +0000
Message-ID: <bug-70354-8800-jclECRdTFY@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2080986174=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2080986174==
Content-Type: multipart/alternative; boundary="1421683139.3f5a855.30118"; charset="UTF-8"


--1421683139.3f5a855.30118
Date: Mon, 19 Jan 2015 15:58:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #43 from Vitaly Torshyn <vitaly.torshyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to aidan from comment #40)
> (In reply to Vitaly Torshyn from comment #39)
> > Hi folks,
> > Please see previously attached dmesg and xorg logs.
> > I was using Ben's git repo to apply a patch for 3.18.2 kernel.
> > Actually, the patch is only removed INIT HUB error. In addition, X was
> > managed to start with AIGLX enabled but nouveau crashed on start any GL
> > enabled application.
> > Please note, the same behavior with SLI enabled. 
> > HW is Lenovo Y510P with dual GT 755M video.
> > 
> > Please, feel free to request additional information.
> 
> I have a similar laptop, and I think the X crashing is this
> (https://bugs.freedesktop.org/show_bug.cgi?id=88514) issue.

I don't think so. The X crashing even with second nvidia GPU installed. In case
intel gpu is turned off by notebooks firmware.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1421683139.3f5a855.30118
Date: Mon, 19 Jan 2015 15:58:59 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c43">Comment # 43</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:vitaly.torshyn&#64;gmail.com" title="Vitaly Torshyn &lt;vitaly.torshyn&#64;gmail.com&gt;"> <span class="fn">Vitaly Torshyn</span></a>
</span></b>
        <pre>(In reply to aidan from <a href="show_bug.cgi?id=70354#c40">comment #40</a>)
<span class="quote">&gt; (In reply to Vitaly Torshyn from <a href="show_bug.cgi?id=70354#c39">comment #39</a>)
&gt; &gt; Hi folks,
&gt; &gt; Please see previously attached dmesg and xorg logs.
&gt; &gt; I was using Ben's git repo to apply a patch for 3.18.2 kernel.
&gt; &gt; Actually, the patch is only removed INIT HUB error. In addition, X was
&gt; &gt; managed to start with AIGLX enabled but nouveau crashed on start any GL
&gt; &gt; enabled application.
&gt; &gt; Please note, the same behavior with SLI enabled. 
&gt; &gt; HW is Lenovo Y510P with dual GT 755M video.
&gt; &gt; 
&gt; &gt; Please, feel free to request additional information.
&gt; 
&gt; I have a similar laptop, and I think the X crashing is this
&gt; (<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - X segfaults when using prime offloading to nouveau card"
   href="show_bug.cgi?id=88514">https://bugs.freedesktop.org/show_bug.cgi?id=88514</a>) issue.</span >

I don't think so. The X crashing even with second nvidia GPU installed. In case
intel gpu is turned off by notebooks firmware.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1421683139.3f5a855.30118--

--===============2080986174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2080986174==--
