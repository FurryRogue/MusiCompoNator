{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_MusiCompoNator (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/furryrogue/Documents/kontor/privat/github/MusiCompoNator/.stack-work/install/x86_64-linux/lts-13.8/8.6.3/bin"
libdir     = "/home/furryrogue/Documents/kontor/privat/github/MusiCompoNator/.stack-work/install/x86_64-linux/lts-13.8/8.6.3/lib/x86_64-linux-ghc-8.6.3/MusiCompoNator-0.1.0.0-2rZzz98aoJ1GYF79WOVZnv"
dynlibdir  = "/home/furryrogue/Documents/kontor/privat/github/MusiCompoNator/.stack-work/install/x86_64-linux/lts-13.8/8.6.3/lib/x86_64-linux-ghc-8.6.3"
datadir    = "/home/furryrogue/Documents/kontor/privat/github/MusiCompoNator/.stack-work/install/x86_64-linux/lts-13.8/8.6.3/share/x86_64-linux-ghc-8.6.3/MusiCompoNator-0.1.0.0"
libexecdir = "/home/furryrogue/Documents/kontor/privat/github/MusiCompoNator/.stack-work/install/x86_64-linux/lts-13.8/8.6.3/libexec/x86_64-linux-ghc-8.6.3/MusiCompoNator-0.1.0.0"
sysconfdir = "/home/furryrogue/Documents/kontor/privat/github/MusiCompoNator/.stack-work/install/x86_64-linux/lts-13.8/8.6.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "MusiCompoNator_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "MusiCompoNator_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "MusiCompoNator_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "MusiCompoNator_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "MusiCompoNator_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "MusiCompoNator_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
