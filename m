From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84515] [NV96] HDMI audio works,
	but has audio gaps or pauses
Date: Tue, 30 Sep 2014 18:18:32 +0000
Message-ID: <bug-84515-8800-pu6zs5Lsq9@http.bugs.freedesktop.org/>
References: <bug-84515-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2089700256=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-84515-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2089700256==
Content-Type: multipart/alternative; boundary="1412101111.4Ef871.14973"; charset="us-ascii"


--1412101111.4Ef871.14973
Date: Tue, 30 Sep 2014 18:18:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84515

Pekka Paalanen <ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #5 from Pekka Paalanen <ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I need to get an mmiotrace from the blob doing audio.

< imirkin_> start it up unplugged, then echo a mark, and then plug it in
< imirkin_> that _should_ be enough
< imirkin_> oh, and make sure stuff displays on there obviously

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1412101111.4Ef871.14973
Date: Tue, 30 Sep 2014 18:18:31 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:ppaalanen&#64;gmail.com" title="Pekka Paalanen &lt;ppaalanen&#64;gmail.com&gt;"> <span class="fn">Pekka Paalanen</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV96] HDMI audio works, but has audio gaps or pauses"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84515">bug 84515</a>
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
           <td>NEEDINFO
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV96] HDMI audio works, but has audio gaps or pauses"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84515#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV96] HDMI audio works, but has audio gaps or pauses"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84515">bug 84515</a>
              from <span class="vcard"><a class="email" href="mailto:ppaalanen&#64;gmail.com" title="Pekka Paalanen &lt;ppaalanen&#64;gmail.com&gt;"> <span class="fn">Pekka Paalanen</span></a>
</span></b>
        <pre>I need to get an mmiotrace from the blob doing audio.

&lt; imirkin_&gt; start it up unplugged, then echo a mark, and then plug it in
&lt; imirkin_&gt; that _should_ be enough
&lt; imirkin_&gt; oh, and make sure stuff displays on there obviously</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1412101111.4Ef871.14973--

--===============2089700256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2089700256==--
