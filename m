From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58305] Kernel crashes if nVidia card is powered off
 and X restartted
Date: Tue, 25 Dec 2012 21:28:47 +0000
Message-ID: <bug-58305-8800-wtYCR2oD4W@http.bugs.freedesktop.org/>
References: <bug-58305-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0200815552=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58305-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0200815552==
Content-Type: multipart/alternative; boundary="1356470927.7d1aFe1.27674"; charset="us-ascii"


--1356470927.7d1aFe1.27674
Date: Tue, 25 Dec 2012 21:28:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58305

Jean-Louis Dupond <jean-louis-h84OYfGOAs2zQB+pC5nmwQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jean-louis-h84OYfGOAs2zQB+pC5nmwQ@public.gmane.org

--- Comment #5 from Jean-Louis Dupond <jean-louis-h84OYfGOAs2zQB+pC5nmwQ@public.gmane.org> ---
I had the exact same crash today.
After disabling my vga card, and shutdown I got the following trace:
http://ubuntu.dupondje.be/20121225_114737.jpg

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1356470927.7d1aFe1.27674
Date: Tue, 25 Dec 2012 21:28:47 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:jean-louis&#64;dupond.be" title="Jean-Louis Dupond &lt;jean-louis&#64;dupond.be&gt;"> <span class="fn">Jean-Louis Dupond</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kernel crashes if nVidia card is powered off and X restartted"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58305">bug 58305</a>
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
           <td>jean-louis&#64;dupond.be
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kernel crashes if nVidia card is powered off and X restartted"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58305#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kernel crashes if nVidia card is powered off and X restartted"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58305">bug 58305</a>
              from <span class="vcard"><a class="email" href="mailto:jean-louis&#64;dupond.be" title="Jean-Louis Dupond &lt;jean-louis&#64;dupond.be&gt;"> <span class="fn">Jean-Louis Dupond</span></a>
</span></b>
        <pre>I had the exact same crash today.
After disabling my vga card, and shutdown I got the following trace:
<a href="http://ubuntu.dupondje.be/20121225_114737.jpg">http://ubuntu.dupondje.be/20121225_114737.jpg</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356470927.7d1aFe1.27674--

--===============0200815552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0200815552==--
