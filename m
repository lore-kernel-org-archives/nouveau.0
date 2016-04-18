From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91523] [NVE7] driver cannot initialize gpu(failed to
 parse ramcfg data)
Date: Mon, 18 Apr 2016 17:17:04 +0000
Message-ID: <bug-91523-8800-9KW5j9oue8@http.bugs.freedesktop.org/>
References: <bug-91523-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1047157285=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91523-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1047157285==
Content-Type: multipart/alternative; boundary="14609998230.FBea0b.18887";
 charset="UTF-8"


--14609998230.FBea0b.18887
Date: Mon, 18 Apr 2016 17:17:03 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=91523

--- Comment #4 from Ilia Bozhinov <iliyabo-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> ---
I tested a kernel build with the relevant code commented(right after the
comment I posted) and indeed the kernel module works! (it loads and DRI_PRIME=1
allows me to run glxgears/glxinfo). What is more, now I get better power
savings because when driver is loaded vgaswitcheroo can turn off the nvidia
card.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14609998230.FBea0b.18887
Date: Mon, 18 Apr 2016 17:17:03 +0000
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
   title="NEW - [NVE7] driver cannot initialize gpu(failed to parse ramcfg data)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91523#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] driver cannot initialize gpu(failed to parse ramcfg data)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91523">bug 91523</a>
              from <span class="vcard"><a class="email" href="mailto:iliyabo&#64;hotmail.com" title="Ilia Bozhinov &lt;iliyabo&#64;hotmail.com&gt;"> <span class="fn">Ilia Bozhinov</span></a>
</span></b>
        <pre>I tested a kernel build with the relevant code commented(right after the
comment I posted) and indeed the kernel module works! (it loads and DRI_PRIME=1
allows me to run glxgears/glxinfo). What is more, now I get better power
savings because when driver is loaded vgaswitcheroo can turn off the nvidia
card.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14609998230.FBea0b.18887--

--===============1047157285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1047157285==--
