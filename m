From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54786] random crashes of X with failed to idle
 channel 0xcccc0000
Date: Fri, 22 Feb 2013 17:20:01 +0000
Message-ID: <bug-54786-8800-SKPl1fxrZy@http.bugs.freedesktop.org/>
References: <bug-54786-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1248036926=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54786-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1248036926==
Content-Type: multipart/alternative; boundary="1361553601.aFF5fe2.20169"; charset="us-ascii"


--1361553601.aFF5fe2.20169
Date: Fri, 22 Feb 2013 17:20:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54786

Steven Newbury <s_j_newbury-/E1597aS9LT10XsdtD+oqA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |s_j_newbury-/E1597aS9LT10XsdtD+oqA@public.gmane.org

--- Comment #5 from Steven Newbury <s_j_newbury-/E1597aS9LT10XsdtD+oqA@public.gmane.org> ---
Still happens here.  Both with linus/master and nouveau-drm-next.  I'm going to
try reverting the above mentioned commit, although it's not obvious to me how
it would be the cause...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361553601.aFF5fe2.20169
Date: Fri, 22 Feb 2013 17:20:01 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:s_j_newbury&#64;yahoo.co.uk" title="Steven Newbury &lt;s_j_newbury&#64;yahoo.co.uk&gt;"> <span class="fn">Steven Newbury</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - random crashes of X with failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54786">bug 54786</a>
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
           <td>s_j_newbury&#64;yahoo.co.uk
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - random crashes of X with failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54786#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - random crashes of X with failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54786">bug 54786</a>
              from <span class="vcard"><a class="email" href="mailto:s_j_newbury&#64;yahoo.co.uk" title="Steven Newbury &lt;s_j_newbury&#64;yahoo.co.uk&gt;"> <span class="fn">Steven Newbury</span></a>
</span></b>
        <pre>Still happens here.  Both with linus/master and nouveau-drm-next.  I'm going to
try reverting the above mentioned commit, although it's not obvious to me how
it would be the cause...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361553601.aFF5fe2.20169--

--===============1248036926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1248036926==--
