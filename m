From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93201] When running a basic OpenGL program with
 DRI_PRIME=1, Xorg crashes
Date: Wed, 02 Dec 2015 12:14:17 +0000
Message-ID: <bug-93201-8800-fEh2vjQ9Q8@http.bugs.freedesktop.org/>
References: <bug-93201-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0987773941=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93201-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0987773941==
Content-Type: multipart/alternative; boundary="1449058458.82E5eC425.3066"; charset="UTF-8"


--1449058458.82E5eC425.3066
Date: Wed, 2 Dec 2015 12:14:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93201

Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Driver/intel                |Driver/nouveau
           Assignee|chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org    |nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org
                   |                            |rg
         QA Contact|intel-gfx-bugs-PD4FTy7X32lMiVNPc3mojA@public.gmane.org |xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
                   |sktop.org                   |

--- Comment #5 from Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org> ---
I'm going to assume the DRICloseScreen in the middle of the stack is just the
unwinder getting confused and so this looks like a nouveau bug and not a core
DRI2 bug.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1449058458.82E5eC425.3066
Date: Wed, 2 Dec 2015 12:14:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:chris&#64;chris-wilson.co.uk" title="Chris Wilson &lt;chris&#64;chris-wilson.co.uk&gt;"> <span class="fn">Chris Wilson</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - When running a basic OpenGL program with DRI_PRIME=1, Xorg crashes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93201">bug 93201</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Component</td>
           <td>Driver/intel
           </td>
           <td>Driver/nouveau
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Assignee</td>
           <td>chris&#64;chris-wilson.co.uk
           </td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">QA Contact</td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
           <td>xorg-team&#64;lists.x.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - When running a basic OpenGL program with DRI_PRIME=1, Xorg crashes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93201#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - When running a basic OpenGL program with DRI_PRIME=1, Xorg crashes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93201">bug 93201</a>
              from <span class="vcard"><a class="email" href="mailto:chris&#64;chris-wilson.co.uk" title="Chris Wilson &lt;chris&#64;chris-wilson.co.uk&gt;"> <span class="fn">Chris Wilson</span></a>
</span></b>
        <pre>I'm going to assume the DRICloseScreen in the middle of the stack is just the
unwinder getting confused and so this looks like a nouveau bug and not a core
DRI2 bug.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1449058458.82E5eC425.3066--

--===============0987773941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0987773941==--
