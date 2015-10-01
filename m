From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Thu, 01 Oct 2015 05:11:00 +0000
Message-ID: <bug-70354-8800-1LItzInCO9@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0495377289=="
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


--===============0495377289==
Content-Type: multipart/alternative; boundary="1443676260.003DfEaA1.29904"; charset="UTF-8"


--1443676260.003DfEaA1.29904
Date: Thu, 1 Oct 2015 05:11:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #64 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Bozhan Boyadzhiev from comment #63)
> (In reply to Ben Skeggs from comment #62)
> > (In reply to Bozhan Boyadzhiev from comment #61)
> > > Created attachment 116853 [details]
> > > mmiotrace for GK107 ~39MB
> > > 
> > > mmiotrace for GK107
> > 
> > Heh, so much for GK107 not having PGOB... I'll ping NVIDIA on this one and
> > get back to you.  If I get time in the next few days, I'll hack you up a
> > patch.
> 
> i've erased the first letter on my keyboard with which begins the domain of
> my webmail to check if i have message from this bug :)))

My nouveau tree[1] has a couple of patches that will *hopefully* fix the issues
you're seeing.

[1] http://cgit.freedesktop.org/~darktama/nouveau/log/

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1443676260.003DfEaA1.29904
Date: Thu, 1 Oct 2015 05:11:00 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c64">Comment # 64</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to Bozhan Boyadzhiev from <a href="show_bug.cgi?id=70354#c63">comment #63</a>)
<span class="quote">&gt; (In reply to Ben Skeggs from <a href="show_bug.cgi?id=70354#c62">comment #62</a>)
&gt; &gt; (In reply to Bozhan Boyadzhiev from <a href="show_bug.cgi?id=70354#c61">comment #61</a>)
&gt; &gt; &gt; Created <span class=""><a href="attachment.cgi?id=116853" name="attach_116853" title="mmiotrace for GK107 ~39MB">attachment 116853</a> <a href="attachment.cgi?id=116853&amp;action=edit" title="mmiotrace for GK107 ~39MB">[details]</a></span>
&gt; &gt; &gt; mmiotrace for GK107 ~39MB
&gt; &gt; &gt; 
&gt; &gt; &gt; mmiotrace for GK107
&gt; &gt; 
&gt; &gt; Heh, so much for GK107 not having PGOB... I'll ping NVIDIA on this one and
&gt; &gt; get back to you.  If I get time in the next few days, I'll hack you up a
&gt; &gt; patch.
&gt; 
&gt; i've erased the first letter on my keyboard with which begins the domain of
&gt; my webmail to check if i have message from this bug :)))</span >

My nouveau tree[1] has a couple of patches that will *hopefully* fix the issues
you're seeing.

[1] <a href="http://cgit.freedesktop.org/~darktama/nouveau/log/">http://cgit.freedesktop.org/~darktama/nouveau/log/</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1443676260.003DfEaA1.29904--

--===============0495377289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0495377289==--
