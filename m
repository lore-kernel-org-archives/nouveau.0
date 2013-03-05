From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61879] Python binding of gbm's gbm_create_device
 fail to create_device
Date: Tue, 05 Mar 2013 23:10:33 +0000
Message-ID: <bug-61879-8800-mVRhC3JIGS@http.bugs.freedesktop.org/>
References: <bug-61879-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0986150928=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61879-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0986150928==
Content-Type: multipart/alternative; boundary="1362525033.b277F70.27770"; charset="us-ascii"


--1362525033.b277F70.27770
Date: Tue, 5 Mar 2013 23:10:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61879

amirouche <amirouche.boubekki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |amirouche.boubekki-Re5JQEeQqe8@public.gmane.org
                   |                            |m
            Version|unspecified                 |git

--- Comment #1 from amirouche <amirouche.boubekki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
my card is reported by lspci as:

01:00.0 VGA compatible controller: NVIDIA Corporation GF114 [GeForce GTX 560
Ti] (rev a1) (prog-if 00 [VGA controller])

eglkms demo from mesa-demo works fine under 9.0.2, 9.1 and git

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362525033.b277F70.27770
Date: Tue, 5 Mar 2013 23:10:33 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:amirouche.boubekki&#64;gmail.com" title="amirouche &lt;amirouche.boubekki&#64;gmail.com&gt;"> <span class="fn">amirouche</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Python binding of gbm's gbm_create_device fail to create_device"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61879">bug 61879</a>
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
           <td>amirouche.boubekki&#64;gmail.com
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Version</td>
           <td>unspecified
           </td>
           <td>git
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Python binding of gbm's gbm_create_device fail to create_device"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61879#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Python binding of gbm's gbm_create_device fail to create_device"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61879">bug 61879</a>
              from <span class="vcard"><a class="email" href="mailto:amirouche.boubekki&#64;gmail.com" title="amirouche &lt;amirouche.boubekki&#64;gmail.com&gt;"> <span class="fn">amirouche</span></a>
</span></b>
        <pre>my card is reported by lspci as:

01:00.0 VGA compatible controller: NVIDIA Corporation GF114 [GeForce GTX 560
Ti] (rev a1) (prog-if 00 [VGA controller])

eglkms demo from mesa-demo works fine under 9.0.2, 9.1 and git</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362525033.b277F70.27770--

--===============0986150928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0986150928==--
