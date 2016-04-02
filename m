From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94803] nouveau bug crashes kernel 4.4.6 on warm boot
Date: Sat, 02 Apr 2016 23:36:31 +0000
Message-ID: <bug-94803-8800-nYw2BUq3En@http.bugs.freedesktop.org/>
References: <bug-94803-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1901603598=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94803-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1901603598==
Content-Type: multipart/alternative; boundary="14596401910.F20E53.19919";
 charset="UTF-8"


--14596401910.F20E53.19919
Date: Sat, 2 Apr 2016 23:36:31 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94803

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
0x80c (2060) looks like this:

   0xffffffff814daf32 <+2050>:    xor    %edx,%edx
   0xffffffff814daf34 <+2052>:    mov    %rax,%rdi
   0xffffffff814daf37 <+2055>:    mov    $0xc,%eax
   0xffffffff814daf3c <+2060>:    divl   -0x88(%rbp)

which has gotta come from

nv50_disp_intr_unk20_2_dp(...) {

    u32 dpctrl = nvkm_rd32(device, 0x61c10c + loff);
    link_nr = hweight32(dpctrl & 0x000f0000);

...

     value = value - (3 * !!(dpctrl & 0x00004000)) - (12 / link_nr);

Which means that on boot link_nr is 0. Michael, if you're up for some kernel
patching, can you just add a

if (!link_nr) {
  nvkm_error(subdev, "link_nr = 0; dpctrl: %08x\n", dpctrl);
  return;
}

right after the link_nr assignment in that function?

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14596401910.F20E53.19919
Date: Sat, 2 Apr 2016 23:36:31 +0000
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
   title="NEW - nouveau bug crashes kernel 4.4.6 on warm boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94803#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau bug crashes kernel 4.4.6 on warm boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94803">bug 94803</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>0x80c (2060) looks like this:

   0xffffffff814daf32 &lt;+2050&gt;:    xor    %edx,%edx
   0xffffffff814daf34 &lt;+2052&gt;:    mov    %rax,%rdi
   0xffffffff814daf37 &lt;+2055&gt;:    mov    $0xc,%eax
   0xffffffff814daf3c &lt;+2060&gt;:    divl   -0x88(%rbp)

which has gotta come from

nv50_disp_intr_unk20_2_dp(...) {

    u32 dpctrl = nvkm_rd32(device, 0x61c10c + loff);
    link_nr = hweight32(dpctrl &amp; 0x000f0000);

...

     value = value - (3 * !!(dpctrl &amp; 0x00004000)) - (12 / link_nr);

Which means that on boot link_nr is 0. Michael, if you're up for some kernel
patching, can you just add a

if (!link_nr) {
  nvkm_error(subdev, &quot;link_nr = 0; dpctrl: %08x\n&quot;, dpctrl);
  return;
}

right after the link_nr assignment in that function?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14596401910.F20E53.19919--

--===============1901603598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1901603598==--
