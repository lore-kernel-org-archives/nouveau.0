From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83992] [NVE0][NVF1] regression,
	linux 3.17 causes gpu lockups
Date: Sat, 11 Oct 2014 22:05:47 +0000
Message-ID: <bug-83992-8800-4FAiiEFBJ7@http.bugs.freedesktop.org/>
References: <bug-83992-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1988694346=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-83992-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1988694346==
Content-Type: multipart/alternative; boundary="1413065147.0Dd06b2.24996"; charset="UTF-8"


--1413065147.0Dd06b2.24996
Date: Sat, 11 Oct 2014 22:05:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83992

David Heidelberger (okias) <david.heidelberger-W22tF5X+A20@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Keywords|                            |bisected
                 CC|                            |david.heidelberger-W22tF5X+A20@public.gmane.org

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1413065147.0Dd06b2.24996
Date: Sat, 11 Oct 2014 22:05:47 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:david.heidelberger&#64;ixit.cz" title="David Heidelberger (okias) &lt;david.heidelberger&#64;ixit.cz&gt;"> <span class="fn">David Heidelberger (okias)</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE0][NVF1] regression, linux 3.17 causes gpu lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83992">bug 83992</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Keywords</td>
           <td>
               &nbsp;
           </td>
           <td>bisected
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>david.heidelberger&#64;ixit.cz
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

--1413065147.0Dd06b2.24996--

--===============1988694346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1988694346==--
