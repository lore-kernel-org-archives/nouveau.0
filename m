From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51409] [NV05] when ubuntu tests the gnome
 environment the nouveau_vieux_dri (ver) segfaults
Date: Sun, 25 Aug 2013 03:40:09 +0000
Message-ID: <bug-51409-8800-CkoAUVQt0l@http.bugs.freedesktop.org/>
References: <bug-51409-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1525088749=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51409-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1525088749==
Content-Type: multipart/alternative; boundary="1377402009.710AFD2.19797"; charset="us-ascii"


--1377402009.710AFD2.19797
Date: Sun, 25 Aug 2013 03:40:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51409

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
In order to make progress on this issue, we'd need a stacktrace, or at least a
disassembly of the code in question. I think each of the crashes happen in the
same place.

If you see:

[   33.776104] unity_support_t[1416]: segfault at 4 ip 0013f564 sp bfb8a430
error 4 in nouveau_vieux_dri.so[131000+2f000]

Then load up nouveau_vieux_dri.so in gdb (gdb /path/to/nouveau_vieux_dri.so)
and run "disassemble 0xe564". I think. (I never remember how to read those
crash reports. But I just did 0x13f564 - 0x131000. No clue what the 0x2f000
is.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377402009.710AFD2.19797
Date: Sun, 25 Aug 2013 03:40:09 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV05] when ubuntu tests the gnome environment the nouveau_vieux_dri (ver) segfaults"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51409">bug 51409</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>NEEDINFO
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV05] when ubuntu tests the gnome environment the nouveau_vieux_dri (ver) segfaults"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51409#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV05] when ubuntu tests the gnome environment the nouveau_vieux_dri (ver) segfaults"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51409">bug 51409</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>In order to make progress on this issue, we'd need a stacktrace, or at least a
disassembly of the code in question. I think each of the crashes happen in the
same place.

If you see:

[   33.776104] unity_support_t[1416]: segfault at 4 ip 0013f564 sp bfb8a430
error 4 in nouveau_vieux_dri.so[131000+2f000]

Then load up nouveau_vieux_dri.so in gdb (gdb /path/to/nouveau_vieux_dri.so)
and run &quot;disassemble 0xe564&quot;. I think. (I never remember how to read those
crash reports. But I just did 0x13f564 - 0x131000. No clue what the 0x2f000
is.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377402009.710AFD2.19797--

--===============1525088749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1525088749==--
