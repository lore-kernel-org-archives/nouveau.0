From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95193] Nouveau not working with Quadro K2200 (NV117)
 and Debian Wheezy
Date: Thu, 05 May 2016 02:30:11 +0000
Message-ID: <bug-95193-8800-pxbLzMDygH@http.bugs.freedesktop.org/>
References: <bug-95193-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0685423067=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95193-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0685423067==
Content-Type: multipart/alternative; boundary="14624154110.d8A6521Ea.917";
 charset="UTF-8"


--14624154110.d8A6521Ea.917
Date: Thu, 5 May 2016 02:30:11 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95193

--- Comment #5 from Regular Guy <figyshki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
@Ilia,

Done. Slapped on Fedora Core 23 (the installer runs 4.2.x kernel, which seems
to have the same issue as its 4.1.x cousins), but upon an update run, kernel
4.4.8-300 was installed, and things work. 

Attached the dmesg output from the 4.4.8-300, for reference. 

The overall goal is to run Qubes OS, so not sure if a later kernel is possible.
Not sure if there's a way to backport 4.4.8's nouveau/drm into a 4.1.3
(probably not, but hey, I can haz hopes?)

Cheers.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14624154110.d8A6521Ea.917
Date: Thu, 5 May 2016 02:30:11 +0000
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
   title="NEW - Nouveau not working with Quadro K2200 (NV117) and Debian Wheezy"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95193#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau not working with Quadro K2200 (NV117) and Debian Wheezy"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95193">bug 95193</a>
              from <span class="vcard"><a class="email" href="mailto:figyshki&#64;gmail.com" title="Regular Guy &lt;figyshki&#64;gmail.com&gt;"> <span class="fn">Regular Guy</span></a>
</span></b>
        <pre>&#64;Ilia,

Done. Slapped on Fedora Core 23 (the installer runs 4.2.x kernel, which seems
to have the same issue as its 4.1.x cousins), but upon an update run, kernel
4.4.8-300 was installed, and things work. 

Attached the dmesg output from the 4.4.8-300, for reference. 

The overall goal is to run Qubes OS, so not sure if a later kernel is possible.
Not sure if there's a way to backport 4.4.8's nouveau/drm into a 4.1.3
(probably not, but hey, I can haz hopes?)

Cheers.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14624154110.d8A6521Ea.917--

--===============0685423067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0685423067==--
