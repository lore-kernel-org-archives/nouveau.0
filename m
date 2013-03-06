From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61879] Python binding of gbm's gbm_create_device
 fail to create_device
Date: Wed, 06 Mar 2013 00:19:03 +0000
Message-ID: <bug-61879-8800-yFa1VeUIla@http.bugs.freedesktop.org/>
References: <bug-61879-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1980789001=="
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


--===============1980789001==
Content-Type: multipart/alternative; boundary="1362529142.7e1AE0.7244"; charset="us-ascii"


--1362529142.7e1AE0.7244
Date: Wed, 6 Mar 2013 00:19:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61879

amirouche <amirouche.boubekki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #3 from amirouche <amirouche.boubekki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I update to libdrm but the bug was in my code I was open the device with python
open instead of the low level os.open which allows for O_RDWR.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362529142.7e1AE0.7244
Date: Wed, 6 Mar 2013 00:19:02 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:amirouche.boubekki&#64;gmail.com" title="amirouche &lt;amirouche.boubekki&#64;gmail.com&gt;"> <span class="fn">amirouche</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - Python binding of gbm's gbm_create_device fail to create_device"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61879">bug 61879</a>
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
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>INVALID
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - Python binding of gbm's gbm_create_device fail to create_device"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61879#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - Python binding of gbm's gbm_create_device fail to create_device"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61879">bug 61879</a>
              from <span class="vcard"><a class="email" href="mailto:amirouche.boubekki&#64;gmail.com" title="amirouche &lt;amirouche.boubekki&#64;gmail.com&gt;"> <span class="fn">amirouche</span></a>
</span></b>
        <pre>I update to libdrm but the bug was in my code I was open the device with python
open instead of the low level os.open which allows for O_RDWR.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362529142.7e1AE0.7244--

--===============1980789001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1980789001==--
