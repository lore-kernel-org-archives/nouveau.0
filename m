From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81136] [NV92] Regression in Linux 3.15: GPU lockup
 after suspend
Date: Mon, 11 Aug 2014 04:15:14 +0000
Message-ID: <bug-81136-8800-9yNYisPWVS@http.bugs.freedesktop.org/>
References: <bug-81136-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1014334678=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81136-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1014334678==
Content-Type: multipart/alternative; boundary="1407730514.B5e63Da61.2117"; charset="us-ascii"


--1407730514.B5e63Da61.2117
Date: Mon, 11 Aug 2014 04:15:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81136

Sven Joachim <svenjoac-Mmb7MZpHnFY@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |svenjoac-Mmb7MZpHnFY@public.gmane.org

--- Comment #6 from Sven Joachim <svenjoac-Mmb7MZpHnFY@public.gmane.org> ---
Same problem here on NV86 [GeForce 8500 GT], reverting commit
ecf24de071f4f6cea79ecef5d990794df5875ee1 in 3.16.0 helps.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1407730514.B5e63Da61.2117
Date: Mon, 11 Aug 2014 04:15:14 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:svenjoac&#64;gmx.de" title="Sven Joachim &lt;svenjoac&#64;gmx.de&gt;"> <span class="fn">Sven Joachim</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] Regression in Linux 3.15: GPU lockup after suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81136">bug 81136</a>
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
           <td>svenjoac&#64;gmx.de
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] Regression in Linux 3.15: GPU lockup after suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81136#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] Regression in Linux 3.15: GPU lockup after suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81136">bug 81136</a>
              from <span class="vcard"><a class="email" href="mailto:svenjoac&#64;gmx.de" title="Sven Joachim &lt;svenjoac&#64;gmx.de&gt;"> <span class="fn">Sven Joachim</span></a>
</span></b>
        <pre>Same problem here on NV86 [GeForce 8500 GT], reverting commit
ecf24de071f4f6cea79ecef5d990794df5875ee1 in 3.16.0 helps.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1407730514.B5e63Da61.2117--

--===============1014334678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1014334678==--
