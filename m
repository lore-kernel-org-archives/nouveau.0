From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74695] nouveau_exa_download_from_screen:299 leads to
 NULL pointer dereference
Date: Fri, 07 Feb 2014 20:37:42 +0000
Message-ID: <bug-74695-8800-xEz6VxpYNg@http.bugs.freedesktop.org/>
References: <bug-74695-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2081803507=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74695-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2081803507==
Content-Type: multipart/alternative; boundary="1391805462.0bc142.10435"; charset="us-ascii"


--1391805462.0bc142.10435
Date: Fri, 7 Feb 2014 20:37:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74695

Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org       |nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org
                   |                            |rg
            Summary|Xorg crashesd with SIGABRT  |nouveau_exa_download_from_s
                   |                            |creen:299 leads to NULL
                   |                            |pointer dereference
          Component|Server/General              |Driver/nouveau

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391805462.0bc142.10435
Date: Fri, 7 Feb 2014 20:37:42 +0000
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
   title="NEW --- - nouveau_exa_download_from_screen:299 leads to NULL pointer dereference"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74695">bug 74695</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Assignee</td>
           <td>xorg-team&#64;lists.x.org
           </td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Xorg crashesd with SIGABRT
           </td>
           <td>nouveau_exa_download_from_screen:299 leads to NULL pointer dereference
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Component</td>
           <td>Server/General
           </td>
           <td>Driver/nouveau
           </td>
         </tr></table>
      <p>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391805462.0bc142.10435--

--===============2081803507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2081803507==--
