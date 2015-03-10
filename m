From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89484] [NVD9] xrandr no output to DisplayPort with
 GeForce GT 520M.
Date: Tue, 10 Mar 2015 20:04:20 +0000
Message-ID: <bug-89484-8800-WNqHL2fAgu@http.bugs.freedesktop.org/>
References: <bug-89484-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0784657928=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89484-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0784657928==
Content-Type: multipart/alternative; boundary="1426017860.E05aE1.32394"; charset="UTF-8"


--1426017860.E05aE1.32394
Date: Tue, 10 Mar 2015 20:04:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89484

--- Comment #8 from Corey Bresnan <corey.quixote-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #7)
> Could you supply a dmesg from a boot with
> 
> nouveau.debug=trace drm.debug=0xe

See below.

> where you try to activate the DP screen? It's unclear whether your vbios
> issue is related to your DP problems. Additionally, can you confirm that
> you've properly set up the provider stuff as per
> http://nouveau.freedesktop.org/wiki/Optimus/ to be able to use reverse
> prime? (I guess if it shows up in xrandr, that's a pretty good sign.)

As far as I can tell, the provider stuff is set up correctly as per the link
(I'm not sure as to what specifically you would like me to confirm, could you
please elaborate?). On closer inspection, I think the VBIOS issue is related,
*but not limited* to my DP problems; I can't seem to access the GPU with other
methods, i.e using the method described in the above link or via bumblebee for
example.

> Lastly, the reason for the VBIOS errors is that we hit unexpected opcodes in
> some scripts. Seeing what the blob does would be instructional. If possible,
> please produce a mmiotrace of nvidia's driver. See
> https://wiki.ubuntu.com/X/MMIOTracing for a quick guide.

See below.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1426017860.E05aE1.32394
Date: Tue, 10 Mar 2015 20:04:20 +0000
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
   title="NEW - [NVD9] xrandr no output to DisplayPort with GeForce GT 520M."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89484#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVD9] xrandr no output to DisplayPort with GeForce GT 520M."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89484">bug 89484</a>
              from <span class="vcard"><a class="email" href="mailto:corey.quixote&#64;gmail.com" title="Corey Bresnan &lt;corey.quixote&#64;gmail.com&gt;"> <span class="fn">Corey Bresnan</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=89484#c7">comment #7</a>)
<span class="quote">&gt; Could you supply a dmesg from a boot with
&gt; 
&gt; nouveau.debug=trace drm.debug=0xe</span >

See below.

<span class="quote">&gt; where you try to activate the DP screen? It's unclear whether your vbios
&gt; issue is related to your DP problems. Additionally, can you confirm that
&gt; you've properly set up the provider stuff as per
&gt; <a href="http://nouveau.freedesktop.org/wiki/Optimus/">http://nouveau.freedesktop.org/wiki/Optimus/</a> to be able to use reverse
&gt; prime? (I guess if it shows up in xrandr, that's a pretty good sign.)</span >

As far as I can tell, the provider stuff is set up correctly as per the link
(I'm not sure as to what specifically you would like me to confirm, could you
please elaborate?). On closer inspection, I think the VBIOS issue is related,
*but not limited* to my DP problems; I can't seem to access the GPU with other
methods, i.e using the method described in the above link or via bumblebee for
example.

<span class="quote">&gt; Lastly, the reason for the VBIOS errors is that we hit unexpected opcodes in
&gt; some scripts. Seeing what the blob does would be instructional. If possible,
&gt; please produce a mmiotrace of nvidia's driver. See
&gt; <a href="https://wiki.ubuntu.com/X/MMIOTracing">https://wiki.ubuntu.com/X/MMIOTracing</a> for a quick guide.</span >

See below.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1426017860.E05aE1.32394--

--===============0784657928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0784657928==--
