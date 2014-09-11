From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64772] [NVC1] nouveau GF108 kernel errors and
 graphics corruption when enabling second output
Date: Thu, 11 Sep 2014 12:54:40 +0000
Message-ID: <bug-64772-8800-o9NIBRpe4i@http.bugs.freedesktop.org/>
References: <bug-64772-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1610298717=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64772-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1610298717==
Content-Type: multipart/alternative; boundary="1410440080.fEfC1.30311"; charset="us-ascii"


--1410440080.fEfC1.30311
Date: Thu, 11 Sep 2014 12:54:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64772

Torsten Krah <krah.tm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |krah.tm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #5 from Torsten Krah <krah.tm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi, still seeing this one:

[15226.801343] nouveau E[      VM][0000:01:00.0] failed to create 0x04000000,
-28
[15226.801349] nouveau E[      VM][0000:01:00.0] failed to create 0x02000000,
-28
[15226.802648] nouveau E[      VM][0000:01:00.0] failed to create 0x04000000,
-28
[15226.802653] nouveau E[      VM][0000:01:00.0] failed to create 0x02000000,
-28
[15226.802708] nouveau E[      VM][0000:01:00.0] failed to create 0x04000000,
-28
[15226.802711] nouveau E[      VM][0000:01:00.0] failed to create 0x02000000,
-28
[15226.802810] nouveau E[      VM][0000:01:00.0] failed to create 0x04000000,
-28
[15226.802813] nouveau E[      VM][0000:01:00.0] failed to create 0x02000000,
-28

Seems to have no obvious impact but got those messages with kernel:

3.13.0-35-generic #62-Ubuntu

Should i open another ticket about those messages?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1410440080.fEfC1.30311
Date: Thu, 11 Sep 2014 12:54:40 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:krah.tm&#64;gmail.com" title="Torsten Krah &lt;krah.tm&#64;gmail.com&gt;"> <span class="fn">Torsten Krah</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVC1] nouveau GF108 kernel errors and graphics corruption when enabling second output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64772">bug 64772</a>
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
           <td>krah.tm&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVC1] nouveau GF108 kernel errors and graphics corruption when enabling second output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64772#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVC1] nouveau GF108 kernel errors and graphics corruption when enabling second output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64772">bug 64772</a>
              from <span class="vcard"><a class="email" href="mailto:krah.tm&#64;gmail.com" title="Torsten Krah &lt;krah.tm&#64;gmail.com&gt;"> <span class="fn">Torsten Krah</span></a>
</span></b>
        <pre>Hi, still seeing this one:

[15226.801343] nouveau E[      VM][0000:01:00.0] failed to create 0x04000000,
-28
[15226.801349] nouveau E[      VM][0000:01:00.0] failed to create 0x02000000,
-28
[15226.802648] nouveau E[      VM][0000:01:00.0] failed to create 0x04000000,
-28
[15226.802653] nouveau E[      VM][0000:01:00.0] failed to create 0x02000000,
-28
[15226.802708] nouveau E[      VM][0000:01:00.0] failed to create 0x04000000,
-28
[15226.802711] nouveau E[      VM][0000:01:00.0] failed to create 0x02000000,
-28
[15226.802810] nouveau E[      VM][0000:01:00.0] failed to create 0x04000000,
-28
[15226.802813] nouveau E[      VM][0000:01:00.0] failed to create 0x02000000,
-28

Seems to have no obvious impact but got those messages with kernel:

3.13.0-35-generic #62-Ubuntu

Should i open another ticket about those messages?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1410440080.fEfC1.30311--

--===============1610298717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1610298717==--
