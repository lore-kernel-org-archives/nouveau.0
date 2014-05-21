From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78106] Reported fan rpm is twice the actual value
	(NVC0)
Date: Wed, 21 May 2014 12:34:38 +0000
Message-ID: <bug-78106-8800-337yjrlltu@http.bugs.freedesktop.org/>
References: <bug-78106-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0187405250=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78106-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0187405250==
Content-Type: multipart/alternative; boundary="1400675678.Ffb47fd2.30737"; charset="us-ascii"


--1400675678.Ffb47fd2.30737
Date: Wed, 21 May 2014 12:34:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78106

Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #4 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
Hi Marcel,

I had a look at your problem last week and the patch landed in Ben Skeggs'
tree:
http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=0a6c57d0bbbffca7346627974c15b1d348c1fcb5

The fix will land in Linux 3.15. It could be backported, but I'm not sure it is
worth the effort.

Thanks for the reporting this issue!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1400675678.Ffb47fd2.30737
Date: Wed, 21 May 2014 12:34:38 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Reported fan rpm is twice the actual value (NVC0)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78106">bug 78106</a>
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
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Reported fan rpm is twice the actual value (NVC0)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78106#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Reported fan rpm is twice the actual value (NVC0)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78106">bug 78106</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>Hi Marcel,

I had a look at your problem last week and the patch landed in Ben Skeggs'
tree:
<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=0a6c57d0bbbffca7346627974c15b1d348c1fcb5">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=0a6c57d0bbbffca7346627974c15b1d348c1fcb5</a>

The fix will land in Linux 3.15. It could be backported, but I'm not sure it is
worth the effort.

Thanks for the reporting this issue!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1400675678.Ffb47fd2.30737--

--===============0187405250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0187405250==--
