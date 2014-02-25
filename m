From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75511] [NVE7] Unknown opcode in VBIOS on one of 2
 cards, fails boot on 3.13+
Date: Tue, 25 Feb 2014 23:13:03 +0000
Message-ID: <bug-75511-8800-MSIEsuXKQ0@http.bugs.freedesktop.org/>
References: <bug-75511-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0743552188=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75511-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0743552188==
Content-Type: multipart/alternative; boundary="1393369983.85a18fC1.8997"; charset="us-ascii"


--1393369983.85a18fC1.8997
Date: Tue, 25 Feb 2014 23:13:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75511

--- Comment #3 from Claas Lorenz <cllorenz-KiJTPfjSHVUubQSw3dWLiw@public.gmane.org> ---
Created attachment 94737
  --> https://bugs.freedesktop.org/attachment.cgi?id=94737&action=edit
output of "nvagetbios -c 1 -s PROM > vbios-1.rom"

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393369983.85a18fC1.8997
Date: Tue, 25 Feb 2014 23:13:03 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] Unknown opcode in VBIOS on one of 2 cards, fails boot on 3.13+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75511#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] Unknown opcode in VBIOS on one of 2 cards, fails boot on 3.13+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75511">bug 75511</a>
              from <span class="vcard"><a class="email" href="mailto:cllorenz&#64;uni-potsdam.de" title="Claas Lorenz &lt;cllorenz&#64;uni-potsdam.de&gt;"> <span class="fn">Claas Lorenz</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=94737" name="attach_94737" title="output of &quot;nvagetbios -c 1 -s PROM &gt; vbios-1.rom&quot;">attachment 94737</a> <a href="attachment.cgi?id=94737&amp;action=edit" title="output of &quot;nvagetbios -c 1 -s PROM &gt; vbios-1.rom&quot;">[details]</a></span>
output of &quot;nvagetbios -c 1 -s PROM &gt; vbios-1.rom&quot;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393369983.85a18fC1.8997--

--===============0743552188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0743552188==--
