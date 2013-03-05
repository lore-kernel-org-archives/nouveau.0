From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60007] BUG: nouveau crashes in various ways in
 32-bits Fedora 18
Date: Tue, 05 Mar 2013 21:01:50 +0000
Message-ID: <bug-60007-8800-gHi4OuUi5i@http.bugs.freedesktop.org/>
References: <bug-60007-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0209427580=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60007-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0209427580==
Content-Type: multipart/alternative; boundary="1362517310.0ADEa1.22707"; charset="us-ascii"


--1362517310.0ADEa1.22707
Date: Tue, 5 Mar 2013 21:01:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60007

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org

--- Comment #17 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Marcin, is your patch upstream somewhere? I also hit the iowrite32 error with
3.7.9, 64-bit:

BUG: unable to handle kernel paging request at ffffc90013a00000
IP: [<ffffffff812eaf98>] iowrite32+0x12/0x33
...
[<ffffffffa014a38e>] nouveau_barobj_wr32+0x16/0x18 [nouveau]
[<ffffffffa0147939>] _nouveau_gpuobj_wr32+0x26/0x28 [nouveau]
[<ffffffffa0147bff>] nouveau_gpuobj_create_+0x1fe/0x243 [nouveau]
[<ffffffffa0147c81>] _nouveau_gpuobj_ctor+0x3d/0x4b [nouveau]
[<ffffffffa0148fb3>] nouveau_object_ctor+0x2b/0x9f [nouveau]
[<ffffffffa0147cdd>] nouveau_gpuobj_new+0x4e/0x50 [nouveau]
[<ffffffffa0160570>] nouveau_vm_get+0x161/0x26c [nouveau]
[<ffffffffa01a026c>] nouveau_bo_vma_add+0x43/0xc2 [nouveau]
[<ffffffffa019be4e>] nouveau_channel_prep+0x156/0x26c [nouveau]
[<ffffffffa019bf9d>] nouveau_channel_new+0x39/0x570 [nouveau]

Twice, in fact, now, both at the exact same address, triggered by chrome.

Should I give this patch a try, or has it been superceded by some other commit?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362517310.0ADEa1.22707
Date: Tue, 5 Mar 2013 21:01:50 +0000
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
   title="NEW --- - BUG: nouveau crashes in various ways in 32-bits Fedora 18"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60007">bug 60007</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>imirkin&#64;alum.mit.edu
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - BUG: nouveau crashes in various ways in 32-bits Fedora 18"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60007#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - BUG: nouveau crashes in various ways in 32-bits Fedora 18"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60007">bug 60007</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Marcin, is your patch upstream somewhere? I also hit the iowrite32 error with
3.7.9, 64-bit:

BUG: unable to handle kernel paging request at ffffc90013a00000
IP: [&lt;ffffffff812eaf98&gt;] iowrite32+0x12/0x33
...
[&lt;ffffffffa014a38e&gt;] nouveau_barobj_wr32+0x16/0x18 [nouveau]
[&lt;ffffffffa0147939&gt;] _nouveau_gpuobj_wr32+0x26/0x28 [nouveau]
[&lt;ffffffffa0147bff&gt;] nouveau_gpuobj_create_+0x1fe/0x243 [nouveau]
[&lt;ffffffffa0147c81&gt;] _nouveau_gpuobj_ctor+0x3d/0x4b [nouveau]
[&lt;ffffffffa0148fb3&gt;] nouveau_object_ctor+0x2b/0x9f [nouveau]
[&lt;ffffffffa0147cdd&gt;] nouveau_gpuobj_new+0x4e/0x50 [nouveau]
[&lt;ffffffffa0160570&gt;] nouveau_vm_get+0x161/0x26c [nouveau]
[&lt;ffffffffa01a026c&gt;] nouveau_bo_vma_add+0x43/0xc2 [nouveau]
[&lt;ffffffffa019be4e&gt;] nouveau_channel_prep+0x156/0x26c [nouveau]
[&lt;ffffffffa019bf9d&gt;] nouveau_channel_new+0x39/0x570 [nouveau]

Twice, in fact, now, both at the exact same address, triggered by chrome.

Should I give this patch a try, or has it been superceded by some other commit?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362517310.0ADEa1.22707--

--===============0209427580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0209427580==--
