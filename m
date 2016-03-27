From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94725] Nouveau driver fails to load on GM204
Date: Sun, 27 Mar 2016 17:50:44 +0000
Message-ID: <bug-94725-8800-C1m4kJoBY9@http.bugs.freedesktop.org/>
References: <bug-94725-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0664359819=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94725-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0664359819==
Content-Type: multipart/alternative; boundary="14591010440.3e0Fc4.8334";
 charset="UTF-8"


--14591010440.3e0Fc4.8334
Date: Sun, 27 Mar 2016 17:50:44 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94725

--- Comment #3 from Rashed Abdel-Tawab <rashed-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #2)
> In addition to the runpm=0 thing, please ensure that you have the
> appropriate firmware installed for this GPU - it should be in
> linux-firmware.git by now (nvidia/*). I don't see a message about nouveaufb,
> which could be due to how you configured your kernel, but it could also be
> because you don't have the firmware, and the user helper is kicking in and
> waiting 60 seconds for it to fail out, so nouveau's not fully done loading
> by the time the runpm stuff kicks in. Just a theory.

I have the gm20x firmware from the linux-firmware repo installed.

(In reply to Pierre Moreau from comment #1)
> Nouveau is successfully loaded on your laptop, but it seems to fail when it
> tries to wake up the NVIDIA GPU (if you look at the dmesg you linked, around
> 11sec, the NVIDIA GPU goes to sleep). You could try booting with
> `nouveau.runpm=0` on the kernel command line, and see if you still get the
> issue.
> Do you have any dmesg from when it hangs?

I'll try that in a bit as well as try to get a dmesg when it hangs (not at my
computer ATM) I see "NMI watchdog: BUG: soft lockup - CPU#0 stuck for 22s!"
when it hangs during a logout/shutdown but that's not particularly helpful.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14591010440.3e0Fc4.8334
Date: Sun, 27 Mar 2016 17:50:44 +0000
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
   title="NEW - Nouveau driver fails to load on GM204"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94725#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver fails to load on GM204"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94725">bug 94725</a>
              from <span class="vcard"><a class="email" href="mailto:rashed&#64;linux.com" title="Rashed Abdel-Tawab &lt;rashed&#64;linux.com&gt;"> <span class="fn">Rashed Abdel-Tawab</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=94725#c2">comment #2</a>)
<span class="quote">&gt; In addition to the runpm=0 thing, please ensure that you have the
&gt; appropriate firmware installed for this GPU - it should be in
&gt; linux-firmware.git by now (nvidia/*). I don't see a message about nouveaufb,
&gt; which could be due to how you configured your kernel, but it could also be
&gt; because you don't have the firmware, and the user helper is kicking in and
&gt; waiting 60 seconds for it to fail out, so nouveau's not fully done loading
&gt; by the time the runpm stuff kicks in. Just a theory.</span >

I have the gm20x firmware from the linux-firmware repo installed.

(In reply to Pierre Moreau from <a href="show_bug.cgi?id=94725#c1">comment #1</a>)
<span class="quote">&gt; Nouveau is successfully loaded on your laptop, but it seems to fail when it
&gt; tries to wake up the NVIDIA GPU (if you look at the dmesg you linked, around
&gt; 11sec, the NVIDIA GPU goes to sleep). You could try booting with
&gt; `nouveau.runpm=0` on the kernel command line, and see if you still get the
&gt; issue.
&gt; Do you have any dmesg from when it hangs?</span >

I'll try that in a bit as well as try to get a dmesg when it hangs (not at my
computer ATM) I see &quot;NMI watchdog: BUG: soft lockup - CPU#0 stuck for 22s!&quot;
when it hangs during a logout/shutdown but that's not particularly helpful.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14591010440.3e0Fc4.8334--

--===============0664359819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0664359819==--
