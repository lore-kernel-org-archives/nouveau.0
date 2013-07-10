From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66696] Nouveau does DMA to/from unexpected address
Date: Wed, 10 Jul 2013 23:00:06 +0000
Message-ID: <bug-66696-8800-Pk7VcMAN1z@http.bugs.freedesktop.org/>
References: <bug-66696-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0962665761=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66696-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0962665761==
Content-Type: multipart/alternative; boundary="1373497206.cBFE1.26676"; charset="us-ascii"


--1373497206.cBFE1.26676
Date: Wed, 10 Jul 2013 23:00:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66696

--- Comment #2 from Stijn Tintel <stijn+bugs-VfPWfsRibaPZj6PxcwrBaQ@public.gmane.org> ---
(In reply to comment #1)
> Has this always been happening, or is this a new issue? (Guessing the
> former...)
I can't tell, as I have been using nvidia.ko until now.

> If it has always been like that, does this issue occur with the nvidia
> binary driver? If not, doing an mmiotrace would be helpful (guide at
> https://wiki.ubuntu.com/X/MMIOTracing). The register written to by 4eb3033c
> only exists on NV50+ according to envytools.
It does not occur with nvidia.ko. MMIOTrace output @
http://stewie.be.tintel.eu/mmiotrace.log

> Are all the errors the same (i.e. trying to read from address 0) or does it
> vary?
Grep on /var/log messages shows only address 0.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1373497206.cBFE1.26676
Date: Wed, 10 Jul 2013 23:00:06 +0000
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
   title="NEW --- - Nouveau does DMA to/from unexpected address"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66696#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau does DMA to/from unexpected address"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66696">bug 66696</a>
              from <span class="vcard"><a class="email" href="mailto:stijn+bugs&#64;linux-ipv6.be" title="Stijn Tintel &lt;stijn+bugs&#64;linux-ipv6.be&gt;"> <span class="fn">Stijn Tintel</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=66696#c1">comment #1</a>)
<span class="quote">&gt; Has this always been happening, or is this a new issue? (Guessing the
&gt; former...)</span >
I can't tell, as I have been using nvidia.ko until now.

<span class="quote">&gt; If it has always been like that, does this issue occur with the nvidia
&gt; binary driver? If not, doing an mmiotrace would be helpful (guide at
&gt; <a href="https://wiki.ubuntu.com/X/MMIOTracing">https://wiki.ubuntu.com/X/MMIOTracing</a>). The register written to by 4eb3033c
&gt; only exists on NV50+ according to envytools.</span >
It does not occur with nvidia.ko. MMIOTrace output &#64;
<a href="http://stewie.be.tintel.eu/mmiotrace.log">http://stewie.be.tintel.eu/mmiotrace.log</a>

<span class="quote">&gt; Are all the errors the same (i.e. trying to read from address 0) or does it
&gt; vary?</span >
Grep on /var/log messages shows only address 0.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1373497206.cBFE1.26676--

--===============0962665761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0962665761==--
