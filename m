From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94832] Reverse Prime corruption with nouveau using
 radeon outputs
Date: Tue, 05 Apr 2016 20:42:12 +0000
Message-ID: <bug-94832-8800-NuQsc30lCo@http.bugs.freedesktop.org/>
References: <bug-94832-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1466363609=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94832-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1466363609==
Content-Type: multipart/alternative; boundary="14598889310.A6D2CF.16525";
 charset="UTF-8"


--14598889310.A6D2CF.16525
Date: Tue, 5 Apr 2016 20:42:11 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94832

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Christoph Haag from comment #5)
> Created attachment 122736 [details]
> dmesg
> 
> Somehow I forgot to check dmesg.
> 
> I guess the
> [   39.172099] nouveau 0000:00:0d.0: bus: MMIO write of 007c0001 FAULT at
> 00b010
> indicate a problem...

Nope, that's expected. Something weird with the PMPEG unit on the cards.
Although usually the errors happen just once at boot... dunno.

And to further clarify, you get the corruption as in the photo no matter what
once you enable the second screen? Given what the photo looks like, seems like
there's an issue with strides... perhaps the fb stride isn't being propagated
properly? All the dispnv04 code is pretty much stuck in antiquity unfortunately
=/ And none of the PRIME stuff has been tested with pre-G80 GPUs.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14598889310.A6D2CF.16525
Date: Tue, 5 Apr 2016 20:42:11 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Reverse Prime corruption with nouveau using radeon outputs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94832#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Reverse Prime corruption with nouveau using radeon outputs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94832">bug 94832</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Christoph Haag from <a href="show_bug.cgi?id=94832#c5">comment #5</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=122736" name="attach_122736" title="dmesg">attachment 122736</a> <a href="attachment.cgi?id=122736&amp;action=edit" title="dmesg">[details]</a></span>
&gt; dmesg
&gt; 
&gt; Somehow I forgot to check dmesg.
&gt; 
&gt; I guess the
&gt; [   39.172099] nouveau 0000:00:0d.0: bus: MMIO write of 007c0001 FAULT at
&gt; 00b010
&gt; indicate a problem...</span >

Nope, that's expected. Something weird with the PMPEG unit on the cards.
Although usually the errors happen just once at boot... dunno.

And to further clarify, you get the corruption as in the photo no matter what
once you enable the second screen? Given what the photo looks like, seems like
there's an issue with strides... perhaps the fb stride isn't being propagated
properly? All the dispnv04 code is pretty much stuck in antiquity unfortunately
=/ And none of the PRIME stuff has been tested with pre-G80 GPUs.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14598889310.A6D2CF.16525--

--===============1466363609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1466363609==--
