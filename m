From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76475] [NVE7] fails to load due to unknown opcode
 0x80 (incorrect vbios)
Date: Sat, 22 Mar 2014 13:29:36 +0000
Message-ID: <bug-76475-8800-3kHaWAmED5@http.bugs.freedesktop.org/>
References: <bug-76475-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1011530595=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76475-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1011530595==
Content-Type: multipart/alternative; boundary="1395494976.1E5e62.15388"; charset="us-ascii"


--1395494976.1E5e62.15388
Date: Sat, 22 Mar 2014 13:29:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76475

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Nouveau fails to load due   |[NVE7] fails to load due to
                   |to unknown opcode 0x80      |unknown opcode 0x80
                   |                            |(incorrect vbios)

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Unfortunately the VBIOS from the PCIROM is often the wrong one. The data here
is the x86 opcodes instead of the vbios opocdes. And as you observed, we now
consider unknown opcodes an error. (The init tables need to be run on e.g.
resume, and if it's a secondary card, on load as well.)

An mmiotrace of the blob loading would potentially be helpful, you can send one
(compressed... xz -9 works well) to mmio.dumps-Re5JQEeQqe9fmgfxC/sS/w@public.gmane.org

Can you provide a bit more info about this system? Is it an optimus setup?
Could you provide an acpidump?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395494976.1E5e62.15388
Date: Sat, 22 Mar 2014 13:29:36 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] fails to load due to unknown opcode 0x80 (incorrect vbios)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76475">bug 76475</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Nouveau fails to load due to unknown opcode 0x80
           </td>
           <td>[NVE7] fails to load due to unknown opcode 0x80 (incorrect vbios)
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] fails to load due to unknown opcode 0x80 (incorrect vbios)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76475#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] fails to load due to unknown opcode 0x80 (incorrect vbios)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76475">bug 76475</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Unfortunately the VBIOS from the PCIROM is often the wrong one. The data here
is the x86 opcodes instead of the vbios opocdes. And as you observed, we now
consider unknown opcodes an error. (The init tables need to be run on e.g.
resume, and if it's a secondary card, on load as well.)

An mmiotrace of the blob loading would potentially be helpful, you can send one
(compressed... xz -9 works well) to <a href="mailto:mmio.dumps&#64;gmail.com">mmio.dumps&#64;gmail.com</a>.

Can you provide a bit more info about this system? Is it an optimus setup?
Could you provide an acpidump?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395494976.1E5e62.15388--

--===============1011530595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1011530595==--
