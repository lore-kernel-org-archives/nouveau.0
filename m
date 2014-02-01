From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73373] [NVE4] GPU lockup after opening many tabs in
 Chromium web browser
Date: Sat, 01 Feb 2014 01:45:44 +0000
Message-ID: <bug-73373-8800-8oHaedt0wz@http.bugs.freedesktop.org/>
References: <bug-73373-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1496165771=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73373-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1496165771==
Content-Type: multipart/alternative; boundary="1391219144.E80fF0.25844"; charset="us-ascii"


--1391219144.E80fF0.25844
Date: Sat, 1 Feb 2014 01:45:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73373

--- Comment #15 from Mario Barrera <mbarrera-KK0ffGbhmjU@public.gmane.org> ---
Maybe useful, opening about 10 tabs with embedded flash elements in Firefox
seems to cause the running Chromium browser to trigger the GPU lockup.

[47622.380883] nouveau E[   PFIFO][0000:01:00.0] PFIFO: read fault at
0x0000038000 [PAGE_NOT_PRESENT] from (unknown enum 0x00000007)/(unknown enum
0x00000006) on channel 0x00becd6000 [unknown]
[47652.758653] nouveau E[     DRM] GPU lockup - switching to software fbcon
[47667.778774] nouveau E[  X[586]] failed to idle channel 0xcccc0001 [X[586]]
[47682.791547] nouveau E[  X[586]] failed to idle channel 0xcccc0001 [X[586]]
[47697.804319] nouveau E[  X[586]] failed to idle channel 0xcccc0000 [X[586]]
[47712.817091] nouveau E[  X[586]] failed to idle channel 0xcccc0000 [X[586]]
[47728.123445] nouveau E[chromium[17985]] failed to idle channel 0xcccc0000
[chromium[17985]]
[47743.136216] nouveau E[chromium[17985]] failed to idle channel 0xcccc0000
[chromium[17985]]
[47758.152323] nouveau E[chromium[1104]] failed to idle channel 0xcccc0000
[chromium[1104]]
[47773.165095] nouveau E[chromium[1104]] failed to idle channel 0xcccc0000
[chromium[1104]]
[47788.184539] nouveau E[plugin-containe[23749]] failed to idle channel
0xcccc0000 [plugin-containe[23749]]
[47803.197309] nouveau E[plugin-containe[23749]] failed to idle channel
0xcccc0000 [plugin-containe[23749]]
[47818.213419] nouveau E[plugin-containe[23749]] failed to idle channel
0xcccc0000 [plugin-containe[23749]]
[47833.226191] nouveau E[plugin-containe[23749]] failed to idle channel
0xcccc0000 [plugin-containe[23749]]
[47848.242298] nouveau E[plugin-containe[23749]] failed to idle channel
0xcccc0000 [plugin-containe[23749]]
[47863.255070] nouveau E[plugin-containe[23749]] failed to idle channel
0xcccc0000 [plugin-containe[23749]]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391219144.E80fF0.25844
Date: Sat, 1 Feb 2014 01:45:44 +0000
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
   title="NEW --- - [NVE4] GPU lockup after opening many tabs in Chromium web browser"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73373#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE4] GPU lockup after opening many tabs in Chromium web browser"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73373">bug 73373</a>
              from <span class="vcard"><a class="email" href="mailto:mbarrera&#64;gmx.com" title="Mario Barrera &lt;mbarrera&#64;gmx.com&gt;"> <span class="fn">Mario Barrera</span></a>
</span></b>
        <pre>Maybe useful, opening about 10 tabs with embedded flash elements in Firefox
seems to cause the running Chromium browser to trigger the GPU lockup.

[47622.380883] nouveau E[   PFIFO][0000:01:00.0] PFIFO: read fault at
0x0000038000 [PAGE_NOT_PRESENT] from (unknown enum 0x00000007)/(unknown enum
0x00000006) on channel 0x00becd6000 [unknown]
[47652.758653] nouveau E[     DRM] GPU lockup - switching to software fbcon
[47667.778774] nouveau E[  X[586]] failed to idle channel 0xcccc0001 [X[586]]
[47682.791547] nouveau E[  X[586]] failed to idle channel 0xcccc0001 [X[586]]
[47697.804319] nouveau E[  X[586]] failed to idle channel 0xcccc0000 [X[586]]
[47712.817091] nouveau E[  X[586]] failed to idle channel 0xcccc0000 [X[586]]
[47728.123445] nouveau E[chromium[17985]] failed to idle channel 0xcccc0000
[chromium[17985]]
[47743.136216] nouveau E[chromium[17985]] failed to idle channel 0xcccc0000
[chromium[17985]]
[47758.152323] nouveau E[chromium[1104]] failed to idle channel 0xcccc0000
[chromium[1104]]
[47773.165095] nouveau E[chromium[1104]] failed to idle channel 0xcccc0000
[chromium[1104]]
[47788.184539] nouveau E[plugin-containe[23749]] failed to idle channel
0xcccc0000 [plugin-containe[23749]]
[47803.197309] nouveau E[plugin-containe[23749]] failed to idle channel
0xcccc0000 [plugin-containe[23749]]
[47818.213419] nouveau E[plugin-containe[23749]] failed to idle channel
0xcccc0000 [plugin-containe[23749]]
[47833.226191] nouveau E[plugin-containe[23749]] failed to idle channel
0xcccc0000 [plugin-containe[23749]]
[47848.242298] nouveau E[plugin-containe[23749]] failed to idle channel
0xcccc0000 [plugin-containe[23749]]
[47863.255070] nouveau E[plugin-containe[23749]] failed to idle channel
0xcccc0000 [plugin-containe[23749]]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391219144.E80fF0.25844--

--===============1496165771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1496165771==--
