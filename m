From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 48464] Crash when GLXVBlank set to true
Date: Tue, 20 Nov 2012 08:04:33 +0000
Message-ID: <bug-48464-8800-0iz3kPDwSn@http.bugs.freedesktop.org/>
References: <bug-48464-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0098638226=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-48464-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0098638226==
Content-Type: multipart/alternative; boundary="1353398673.a24A71.30251"; charset="us-ascii"


--1353398673.a24A71.30251
Date: Tue, 20 Nov 2012 08:04:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=48464

Marcel Dopita <mdop-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |VERIFIED

--- Comment #10 from Marcel Dopita <mdop-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org> ---
I have just tested it and I can confirm that it really fixed my original issue.
Now I'm using different MB and CPU but GPU and everything else is the same.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1353398673.a24A71.30251
Date: Tue, 20 Nov 2012 08:04:33 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:mdop&#64;seznam.cz" title="Marcel Dopita &lt;mdop&#64;seznam.cz&gt;"> <span class="fn">Marcel Dopita</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_VERIFIED  bz_closed"
   title="VERIFIED FIXED - Crash when GLXVBlank set to true"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48464">bug 48464</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>VERIFIED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_VERIFIED  bz_closed"
   title="VERIFIED FIXED - Crash when GLXVBlank set to true"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48464#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_VERIFIED  bz_closed"
   title="VERIFIED FIXED - Crash when GLXVBlank set to true"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48464">bug 48464</a>
              from <span class="vcard"><a class="email" href="mailto:mdop&#64;seznam.cz" title="Marcel Dopita &lt;mdop&#64;seznam.cz&gt;"> <span class="fn">Marcel Dopita</span></a>
</span></b>
        <pre>I have just tested it and I can confirm that it really fixed my original issue.
Now I'm using different MB and CPU but GPU and everything else is the same.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1353398673.a24A71.30251--

--===============0098638226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0098638226==--
