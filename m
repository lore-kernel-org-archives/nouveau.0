From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71662] [nvd9] hang: nouveau ![ PFIFO][0000:01:00.0]
 unhandled status 0x00800000
Date: Sat, 16 Nov 2013 05:02:00 +0000
Message-ID: <bug-71662-8800-UQgw2zL6NI@http.bugs.freedesktop.org/>
References: <bug-71662-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1984154880=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71662-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1984154880==
Content-Type: multipart/alternative; boundary="1384578119.72DF40A0.25260"; charset="us-ascii"


--1384578119.72DF40A0.25260
Date: Sat, 16 Nov 2013 05:01:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71662

Jan Vesely <jano.vesely-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[nvd9 regression] 3d        |[nvd9] hang: nouveau ![
                   |application hang            |PFIFO][0000:01:00.0]
                   |                            |unhandled status 0x00800000

--- Comment #7 from Jan Vesely <jano.vesely-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
nvm, I just reproduced it on 3.11.6. It was a bit harder to hit but after cca
20 runs I got unhandled status 0x00800000. Not a regression.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384578119.72DF40A0.25260
Date: Sat, 16 Nov 2013 05:01:59 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:jano.vesely&#64;gmail.com" title="Jan Vesely &lt;jano.vesely&#64;gmail.com&gt;"> <span class="fn">Jan Vesely</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvd9] hang: nouveau ![ PFIFO][0000:01:00.0] unhandled status 0x00800000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71662">bug 71662</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>[nvd9 regression] 3d application hang
           </td>
           <td>[nvd9] hang: nouveau ![   PFIFO][0000:01:00.0] unhandled status 0x00800000
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvd9] hang: nouveau ![ PFIFO][0000:01:00.0] unhandled status 0x00800000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71662#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvd9] hang: nouveau ![ PFIFO][0000:01:00.0] unhandled status 0x00800000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71662">bug 71662</a>
              from <span class="vcard"><a class="email" href="mailto:jano.vesely&#64;gmail.com" title="Jan Vesely &lt;jano.vesely&#64;gmail.com&gt;"> <span class="fn">Jan Vesely</span></a>
</span></b>
        <pre>nvm, I just reproduced it on 3.11.6. It was a bit harder to hit but after cca
20 runs I got unhandled status 0x00800000. Not a regression.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384578119.72DF40A0.25260--

--===============1984154880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1984154880==--
