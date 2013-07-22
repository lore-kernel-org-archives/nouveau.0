From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Mon, 22 Jul 2013 22:47:34 +0000
Message-ID: <bug-67051-8800-G26VQhGSJ1@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1859207497=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67051-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1859207497==
Content-Type: multipart/alternative; boundary="1374533254.fEd5c2b61.18569"; charset="us-ascii"


--1374533254.fEd5c2b61.18569
Date: Mon, 22 Jul 2013 22:47:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #66 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #65)
> Created attachment 82848 [details]
> dmesg f79
> 
> I cranked "log_buf_len" up all the way to 2M.

Well you definitely have all the stuff in there now. However I don't see the
things I expected to see. Which means that for reasons beyond me they're not
under PDISP :( Sorry for making you go through all this and have it end up a
waste. I really think that mmiotrace is the way to go at this point.

> 
> On a more serious vein (while experiencing the same excitement) I just
> noticed that after hdmi-1.patch + hdminva3.patch + hdminva3-4.patch,
> file 'hdminv84.c' retains the same size, although a quite different content:
> 
> []$ diff hdminv84.c-orig hdminv84.c     
> 
> 47,48d46
> <       nv_wr32(priv, 0x616534 + hoff, 0x00000000);
> <       nv_wr32(priv, 0x616538 + hoff, 0x00000000);
> 54c52
> <       nv_wr32(priv, 0x61650c + hoff, 0x00000071);
> ---
> >       nv_wr32(priv, 0x61650c + hoff, 0x00000170);
> 55a54,55
> >       nv_wr32(priv, 0x616514 + hoff, 0x00000000);
> >       nv_wr32(priv, 0x616518 + hoff, 0x00000000);
> 64c64
> <       nv_mask(priv, 0x6165a4 + hoff, 0x5f1f007f, data | 0x1f000000 /* ???
> */);
> ---
> >       nv_mask(priv, 0x6165a4 + hoff, 0x5f1f003f, data | 0x1f000000 /* ??? */);
> 
> Just checkin'.

Yep. Just changing some values to be more in line with what they were before
the refactor, vainly hoping that they would fix your issue.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374533254.fEd5c2b61.18569
Date: Mon, 22 Jul 2013 22:47:34 +0000
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
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c66">Comment # 66</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67051#c65">comment #65</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=82848" name="attach_82848" title="dmesg f79">attachment 82848</a> <a href="attachment.cgi?id=82848&amp;action=edit" title="dmesg f79">[details]</a></span>
&gt; dmesg f79
&gt; 
&gt; I cranked &quot;log_buf_len&quot; up all the way to 2M.</span >

Well you definitely have all the stuff in there now. However I don't see the
things I expected to see. Which means that for reasons beyond me they're not
under PDISP :( Sorry for making you go through all this and have it end up a
waste. I really think that mmiotrace is the way to go at this point.

<span class="quote">&gt; 
&gt; On a more serious vein (while experiencing the same excitement) I just
&gt; noticed that after hdmi-1.patch + hdminva3.patch + hdminva3-4.patch,
&gt; file 'hdminv84.c' retains the same size, although a quite different content:
&gt; 
&gt; []$ diff hdminv84.c-orig hdminv84.c     
&gt; 
&gt; 47,48d46
&gt; &lt;       nv_wr32(priv, 0x616534 + hoff, 0x00000000);
&gt; &lt;       nv_wr32(priv, 0x616538 + hoff, 0x00000000);
&gt; 54c52
&gt; &lt;       nv_wr32(priv, 0x61650c + hoff, 0x00000071);
&gt; ---
&gt; &gt;       nv_wr32(priv, 0x61650c + hoff, 0x00000170);
&gt; 55a54,55
&gt; &gt;       nv_wr32(priv, 0x616514 + hoff, 0x00000000);
&gt; &gt;       nv_wr32(priv, 0x616518 + hoff, 0x00000000);
&gt; 64c64
&gt; &lt;       nv_mask(priv, 0x6165a4 + hoff, 0x5f1f007f, data | 0x1f000000 /* ???
&gt; */);
&gt; ---
&gt; &gt;       nv_mask(priv, 0x6165a4 + hoff, 0x5f1f003f, data | 0x1f000000 /* ??? */);
&gt; 
&gt; Just checkin'.</span >

Yep. Just changing some values to be more in line with what they were before
the refactor, vainly hoping that they would fix your issue.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374533254.fEd5c2b61.18569--

--===============1859207497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1859207497==--
