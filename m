From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89558] [NV118] GM108 not supported by nouveau
Date: Thu, 21 May 2015 05:47:58 +0000
Message-ID: <bug-89558-8800-EZxCoYPIag@http.bugs.freedesktop.org/>
References: <bug-89558-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0589389582=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89558-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0589389582==
Content-Type: multipart/alternative; boundary="1432187278.EFAD3.22764"; charset="UTF-8"


--1432187278.EFAD3.22764
Date: Thu, 21 May 2015 05:47:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89558

--- Comment #32 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ben Skeggs from comment #31)
> (In reply to Ben Skeggs from comment #30)
> > (In reply to SMF from comment #27)
> > > I have noticed that if the nouveau module is removed and re-added the second
> > > instance calculated the VRAM size correctly:
> > > 
> > > modprobe nouveau;rmmod nouveau;modprobe nouveau
> > Can you please grab a mmiotrace of attempting to load nouveau the first
> > time?  Perhaps also grab the second time too for comparison.
> > 
> > Thanks,
> > Ben.
> 
> Also, another thing worth trying in the meantime is adding
> "nouveau.config=NvForcePost=1" to your kernel config options.

Even better, try this commit (and the previous one):

http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=cf5c2a749912102055844b51a40b3ef64210afe6

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432187278.EFAD3.22764
Date: Thu, 21 May 2015 05:47:58 +0000
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
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558#c32">Comment # 32</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558">bug 89558</a>
              from <span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to Ben Skeggs from <a href="show_bug.cgi?id=89558#c31">comment #31</a>)
<span class="quote">&gt; (In reply to Ben Skeggs from <a href="show_bug.cgi?id=89558#c30">comment #30</a>)
&gt; &gt; (In reply to SMF from <a href="show_bug.cgi?id=89558#c27">comment #27</a>)
&gt; &gt; &gt; I have noticed that if the nouveau module is removed and re-added the second
&gt; &gt; &gt; instance calculated the VRAM size correctly:
&gt; &gt; &gt; 
&gt; &gt; &gt; modprobe nouveau;rmmod nouveau;modprobe nouveau
&gt; &gt; Can you please grab a mmiotrace of attempting to load nouveau the first
&gt; &gt; time?  Perhaps also grab the second time too for comparison.
&gt; &gt; 
&gt; &gt; Thanks,
&gt; &gt; Ben.
&gt; 
&gt; Also, another thing worth trying in the meantime is adding
&gt; &quot;nouveau.config=NvForcePost=1&quot; to your kernel config options.</span >

Even better, try this commit (and the previous one):

<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=cf5c2a749912102055844b51a40b3ef64210afe6">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=cf5c2a749912102055844b51a40b3ef64210afe6</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432187278.EFAD3.22764--

--===============0589389582==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0589389582==--
