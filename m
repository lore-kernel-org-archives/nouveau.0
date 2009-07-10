From: Sean Estabrooks <seanlkml@sympatico.ca>
Subject: Re: [Nouveau] When will nouveau kernel tree be merged into master
Date: Fri, 10 Jul 2009 00:39:40 -0700
Message-ID: <BLU0-SMTP5459C57EAE328F89E4E6B5AE270@phx.gbl>
References: <4A55DBDD.6030703@Free.fr>
	<20090709193053.5a5d6430@daedalus.pq.iki.fi>
	<4A5626F6.4090607@free.fr>
	<20090709205154.4f613cc5@daedalus.pq.iki.fi>
	<4A564A3B.1050905@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.sourceforge.net>
In-Reply-To: <4A564A3B.1050905@free.fr>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=dri-devel>
List-Post: <mailto:dri-devel@lists.sourceforge.net>
List-Help: <mailto:dri-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: dri-devel-bounces@lists.sourceforge.net
To: eric.valette@free.fr
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.sourceforge.net
List-Id: nouveau.vger.kernel.org

On Thu, 09 Jul 2009 21:51:23 +0200
Eric Valette <eric.valette@free.fr> wrote:

> The command
> git clone git://anongit.freedesktop.org/git/mesa/mesa
> 
> Does not work for me while others do. It hangs indefinitely (I let it
> run once half a day, doing strace to see that I was waiting to a read on
> a socket).
> 
> > Also, I'd recommend studying git, you only ever have to 'clone' once.
> 
> If the full clone requires a day on 1Mbit sped, I guess you will have
> few volunteers.

Eric,

Tried the clone of Mesa just now here and it took a little over 5 minutes
to complete.  So, something is wrong for you locally or a server problem
has been fixed since you last tried the clone.   Either way, this isn't
a fundamental problem with Git.

Cheers,
Sean

------------------------------------------------------------------------------
Enter the BlackBerry Developer Challenge  
This is your chance to win up to $100,000 in prizes! For a limited time, 
vendors submitting new applications to BlackBerry App World(TM) will have
the opportunity to enter the BlackBerry Developer Challenge. See full prize  
details at: http://p.sf.net/sfu/Challenge
--
