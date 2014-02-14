From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74316] [NV92] Graphical corruption on KDE
 shutdown/restart/log out screen
Date: Fri, 14 Feb 2014 18:09:36 +0000
Message-ID: <bug-74316-8800-ijqwhSWIII@http.bugs.freedesktop.org/>
References: <bug-74316-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1033451870=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74316-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1033451870==
Content-Type: multipart/alternative; boundary="1392401375.cD3d61.19689"; charset="us-ascii"


--1392401375.cD3d61.19689
Date: Fri, 14 Feb 2014 18:09:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74316

AnAkkk <anakin.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         QA Contact|xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org       |
            Product|xorg                        |Mesa
          Component|Driver/nouveau              |Drivers/DRI/nouveau

--- Comment #4 from AnAkkk <anakin.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Here's the error I get with MESA_DEBUG=1:
Mesa: User error: GL_INVALID_OPERATION in glBlitFramebufferEXT(bad src/dst
multisample pixel formats)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392401375.cD3d61.19689
Date: Fri, 14 Feb 2014 18:09:35 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:anakin.cs&#64;gmail.com" title="AnAkkk &lt;anakin.cs&#64;gmail.com&gt;"> <span class="fn">AnAkkk</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] Graphical corruption on KDE shutdown/restart/log out screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74316">bug 74316</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">QA Contact</td>
           <td>xorg-team&#64;lists.x.org
           </td>
           <td>
               &nbsp;
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Product</td>
           <td>xorg
           </td>
           <td>Mesa
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Component</td>
           <td>Driver/nouveau
           </td>
           <td>Drivers/DRI/nouveau
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] Graphical corruption on KDE shutdown/restart/log out screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74316#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] Graphical corruption on KDE shutdown/restart/log out screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74316">bug 74316</a>
              from <span class="vcard"><a class="email" href="mailto:anakin.cs&#64;gmail.com" title="AnAkkk &lt;anakin.cs&#64;gmail.com&gt;"> <span class="fn">AnAkkk</span></a>
</span></b>
        <pre>Here's the error I get with MESA_DEBUG=1:
Mesa: User error: GL_INVALID_OPERATION in glBlitFramebufferEXT(bad src/dst
multisample pixel formats)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392401375.cD3d61.19689--

--===============1033451870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1033451870==--
