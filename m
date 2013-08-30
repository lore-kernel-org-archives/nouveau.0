From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57081] [NVA8] dell latitude laptop E6510 with
 nouveau and nvs3100 nvidia doesn't resume properly
Date: Fri, 30 Aug 2013 22:32:33 +0000
Message-ID: <bug-57081-8800-ON1ZPMBWO8@http.bugs.freedesktop.org/>
References: <bug-57081-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0849822409=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57081-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0849822409==
Content-Type: multipart/alternative; boundary="1377901953.aFecc062.4393"; charset="us-ascii"


--1377901953.aFecc062.4393
Date: Fri, 30 Aug 2013 22:32:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57081

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|dell latitude laptop E6510  |[NVA8] dell latitude laptop
                   |with nouveau and nvs3100    |E6510 with nouveau and
                   |nvidia doesn't resume       |nvs3100 nvidia doesn't
                   |properly                    |resume properly

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Please re-test with the latest kernel (e.g. 3.11-rc7). If problems persist,
please include a log that includes the boot. If it hangs, grab dmesg via ssh,
that will be most useful. (If it gets cut off, you can increase the log limit.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377901953.aFecc062.4393
Date: Fri, 30 Aug 2013 22:32:33 +0000
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
   title="NEW --- - [NVA8] dell latitude laptop E6510 with nouveau and nvs3100 nvidia doesn't resume properly"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57081">bug 57081</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>dell latitude laptop E6510 with nouveau and nvs3100 nvidia doesn't resume properly
           </td>
           <td>[NVA8] dell latitude laptop E6510 with nouveau and nvs3100 nvidia doesn't resume properly
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] dell latitude laptop E6510 with nouveau and nvs3100 nvidia doesn't resume properly"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57081#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] dell latitude laptop E6510 with nouveau and nvs3100 nvidia doesn't resume properly"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57081">bug 57081</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Please re-test with the latest kernel (e.g. 3.11-rc7). If problems persist,
please include a log that includes the boot. If it hangs, grab dmesg via ssh,
that will be most useful. (If it gets cut off, you can increase the log limit.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377901953.aFecc062.4393--

--===============0849822409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0849822409==--
